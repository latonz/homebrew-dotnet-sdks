#!/usr/bin/env -S dotnet run
#:package NuGet.Versioning@7.0.0

using System.Buffers;
using System.Net.Http.Json;
using System.Security.Cryptography;
using System.Text.Json;
using System.Text.Json.Serialization;
using NuGet.Versioning;

const string releaseIndexUrl = "https://raw.githubusercontent.com/dotnet/core/main/release-notes/releases-index.json";
const string intelRuntimeId = "osx-x64";
const string armRuntimeId = "osx-arm64";
const string macOsPkgExt = ".pkg";
const string stateFile = "state.json";
const string changesSummaryFile = "changes-summary.txt";
const int hashBufferLength = 4096;

await using var changesSummaryWriter = new StreamWriter(File.OpenWrite(changesSummaryFile));
var jsonContext = AppJsonContext.Default;

var state = await LoadState();
using var client = new HttpClient();
var releasesIndex = await client.GetFromJsonAsync(releaseIndexUrl, jsonContext.ReleaseIndexList)
    ?? throw new Exception("Could not fetch release index list");

await changesSummaryWriter.WriteLineAsync("Updating formulas");
await changesSummaryWriter.WriteLineAsync();
Log("processing releases after " + state.LatestReleaseDate);

foreach (var releaseIndex in releasesIndex.ReleasesIndex.Where(x => x.LatestReleaseDate > state.LatestReleaseDate))
{
    var releases = await client.GetFromJsonAsync(releaseIndex.ReleasesUrl, jsonContext.ReleaseList)
        ?? throw new Exception("Could not fetch releases");

    foreach (var release in releases.Releases.Where(x => x.ReleaseDate > state.LatestReleaseDate))
    {
        if (!state.KnownSdkVersions.Add(release.Sdk.Version))
            continue;

        var sdkFiles = release.Sdk.Files
            .Where(x => x.Rid is armRuntimeId or intelRuntimeId && x.Name.EndsWith(macOsPkgExt, StringComparison.Ordinal))
            .GroupBy(x => x.Rid)
            .ToDictionary(x => x.Key, x => x.First());

        var hasIntelSdk = sdkFiles.TryGetValue(intelRuntimeId, out var intelSdkFile);
        var hasArmSdk = sdkFiles.TryGetValue(armRuntimeId, out var armSdkFile);
        if (!hasIntelSdk && !hasArmSdk)
            continue;

        Log($"processing {release.Sdk.Version}");

        var formula = new Formula
        {
            Product = releaseIndex.Product,
            ReleaseVersion = release.ReleaseVersion,
            SdkVersion = release.Sdk.Version,
            IntelVariant = hasIntelSdk ? await BuildVariant(client, release, intelSdkFile!) : null,
            ArmVariant = hasArmSdk ? await BuildVariant(client, release, armSdkFile!) : null,
        };

        await StoreFormula(formula);

        if (release.Sdk.Version.Equals(releases.LatestSdk))
        {
            formula.Channel = releases.ChannelVersion;
            await StoreFormula(formula);
        }
    }
}

state.LatestReleaseDate = releasesIndex.ReleasesIndex.Max(x => x.LatestReleaseDate);
await StoreState(state);

async Task<State> LoadState()
{
    if (!File.Exists(stateFile))
        return new State();
    
    await using var stream = File.OpenRead(stateFile);
    var loadedState = await JsonSerializer.DeserializeAsync(stream, jsonContext.State) ?? new State();

    if (string.Equals("true", Environment.GetEnvironmentVariable("RESET_LATEST_RELEASE_DATE"), StringComparison.OrdinalIgnoreCase))
    {
        loadedState.LatestReleaseDate = DateOnly.MinValue;
    }

    return loadedState;
}

async Task StoreState(State stateToStore)
{
    await using var stream = File.Create(stateFile);
    await JsonSerializer.SerializeAsync(stream, stateToStore, jsonContext.State);
}

void Log(string msg) => Console.WriteLine(msg);

async Task<FormulaVariant> BuildVariant(HttpClient httpClient, Release release, ReleaseFile sdkFile)
{
    // we cannot use the provided hash since its sha512
    // but homebrew requires sha256
    var (sha256, sha512) = await ComputeHash(httpClient, sdkFile.Url);
    if (!string.Equals(sha512, sdkFile.Hash, StringComparison.OrdinalIgnoreCase))
        throw new Exception($"Hash verification of {sdkFile.Url} failed");
    
    return new FormulaVariant
    {
        PkgName = sdkFile.Url.Split("/").Last(),
        Sha256 = sha256,
        DownloadUrl = sdkFile.Url,
        DownloadUrlWithVersionPlaceholder = sdkFile.Url.Replace(release.Sdk.Version.ToNormalizedString(), "#{version.before_comma}"),
    };
}

async Task<(string Sha256, string Sha512)> ComputeHash(HttpClient httpClient, string url)
{
    await using var fileStream = await httpClient.GetStreamAsync(url);

    using var sha256 = IncrementalHash.CreateHash(HashAlgorithmName.SHA256);
    using var sha512 = IncrementalHash.CreateHash(HashAlgorithmName.SHA512);
    
    var buffer = ArrayPool<byte>.Shared.Rent(hashBufferLength);
    while (true)
    {
        var bufferReadLength = await fileStream.ReadAsync(buffer);
        if (bufferReadLength <= 0)
            break;

        sha256.AppendData(buffer, 0, bufferReadLength);
        sha512.AppendData(buffer, 0, bufferReadLength);
    }

    ArrayPool<byte>.Shared.Return(buffer);
    return (
        Convert.ToHexString(sha256.GetCurrentHash()),
        Convert.ToHexString(sha512.GetCurrentHash()));
}

async Task StoreFormula(Formula formula)
{
    if (File.Exists(formula.FilePath))
    {
        Log($"writing updated formula {formula.ChannelOrSdkVersion}");
        await changesSummaryWriter.WriteLineAsync("* Updated " + formula.ChannelOrSdkVersion);
    }
    else
    {
        Log($"adding formula {formula.ChannelOrSdkVersion}");
        await changesSummaryWriter.WriteLineAsync("* Added " + formula.ChannelOrSdkVersion);
    }
    
    var formulaStr = BuildFormula(formula);
    Directory.CreateDirectory(Path.GetDirectoryName(formula.FilePath)!);
    await File.WriteAllTextAsync(formula.FilePath, formulaStr);
}

string BuildFormula(Formula formula)
{
    return $$"""
             cask "{{formula.Id}}" do
                 version "{{formula.SdkVersion}},{{formula.ReleaseVersion}}"
                 
                 {{BuildFormulaVariants(formula)}}
             
                 name "{{formula.Product}} SDK {{formula.SdkVersion}},{{formula.ReleaseVersion}}"
                 desc "Developer platform"
                 homepage "https://www.microsoft.com/net/core#macos"
             
                 conflicts_with cask: [
                     "dotnet-sdk",
                     "homebrew/cask-versions/dotnet-preview",
                     "homebrew/cask-versions/dotnet-sdk-preview",
                 ]
             
                 uninstall pkgutil: [
                     "com.microsoft.dotnet.*.#{version.after_comma}.*",
                     "com.microsoft.netstandard.pack.targeting.*.#{version.after_comma}.*",
                     "com.microsoft.dotnet.*.#{version.before_comma}.*",
                     "com.microsoft.netstandard.pack.targeting.*.#{version.before_comma}.*",
                 ]
             
                 zap trash: ["~/.dotnet", "~/.nuget", "/etc/paths.d/dotnet", "/etc/paths.d/dotnet-cli-tools"]
             end
             """;
}

string BuildFormulaVariants(Formula formula)
{
    if (formula is { IntelVariant: not null, ArmVariant: not null })
    {
        return $"""
                if Hardware::CPU.intel?
                        {BuildFormulaVariant(formula.IntelVariant, 2)}
                    else
                        {BuildFormulaVariant(formula.ArmVariant, 2)}
                    end
                """;
    }

    return BuildFormulaVariant((formula.IntelVariant ?? formula.ArmVariant)!, 1);
}

string BuildFormulaVariant(FormulaVariant formulaVariant, int indentLevel)
{
    var indention = string.Join("", Enumerable.Repeat(" ", indentLevel * 4));
    return $"""
            url "{formulaVariant.DownloadUrlWithVersionPlaceholder}"
            {indention}sha256 "{formulaVariant.Sha256}"
            {indention}pkg "{formulaVariant.PkgName}"
            """;
}

class State
{
    public SortedSet<NuGetVersion> KnownSdkVersions { get; set; } = new();

    public DateOnly LatestReleaseDate { get; set; }
}

class Formula
{
    public string Id => $"dotnet-sdk-{ChannelOrSdkVersion.Replace(".", "-")}";

    public string FilePath => Path.GetFullPath(Path.Combine(".", "Casks", Id + ".rb"));

    public string ChannelOrSdkVersion => Channel ?? SdkVersion.ToNormalizedString();

    public string? Channel { get; set; }

    public required NuGetVersion SdkVersion { get; init; }

    /// <summary>
    /// Gets or sets the release version.
    /// </summary>
    public required NuGetVersion ReleaseVersion { get; set; }

    /// <summary>
    /// Gets or sets the product.
    /// <example>.NET</example>
    /// <example>.NET Core</example>
    /// </summary>
    public string Product { get; set; } = string.Empty;

    public FormulaVariant? IntelVariant { get; set; }

    public FormulaVariant? ArmVariant { get; set; }
}

class FormulaVariant
{
    /// <summary>
    /// Gets or sets the name of the installer incl. the extension.
    /// <example>dotnet-sdk-5.0.300-osx-x64.pkg</example>
    /// </summary>
    public required string PkgName { get; init; }

    /// <summary>
    /// Gets or sets the sha256 as a hex string.
    /// </summary>
    public required string Sha256 { get; init; }

    public required string DownloadUrl { get; init; }

    public required string DownloadUrlWithVersionPlaceholder { get; init; }
}

class ReleaseIndexList
{
    [JsonPropertyName("releases-index")]
    public required List<ReleaseIndex> ReleasesIndex { get; init; }
}

class ReleaseIndex
{
    public required string Product { get; init; }

    [JsonPropertyName("latest-release-date")]
    public required DateOnly LatestReleaseDate { get; init; }

    [JsonPropertyName("releases.json")]
    public required string ReleasesUrl { get; init; }
}

class ReleaseList
{
    [JsonPropertyName("channel-version")]
    public required string ChannelVersion { get; init; }

    [JsonPropertyName("latest-sdk")]
    public required NuGetVersion LatestSdk { get; init; }

    public required List<Release> Releases { get; init; }
}

class Release
{
    [JsonPropertyName("release-date")]
    public required DateOnly ReleaseDate { get; init; }

    [JsonPropertyName("release-version")]
    public required NuGetVersion ReleaseVersion { get; init; }

    public required SdkRelease Sdk { get; init; }
}

class SdkRelease
{
    public required NuGetVersion Version { get; init; }
    public required List<ReleaseFile> Files { get; init; }
}

class ReleaseFile
{
    public required string Name { get; init; }

    public required string Rid { get; init; }

    public required string Url { get; init; }

    /// <summary>
    /// SHA512
    /// </summary>
    public required string Hash { get; init; }
}

[JsonSourceGenerationOptions(
    GenerationMode = JsonSourceGenerationMode.Metadata,
    PropertyNamingPolicy = JsonKnownNamingPolicy.CamelCase,
    WriteIndented = true,
    Converters = new[] { typeof(NuGetVersionJsonConverter) })]
[JsonSerializable(typeof(State))]
[JsonSerializable(typeof(ReleaseIndexList))]
[JsonSerializable(typeof(ReleaseList))]
internal partial class AppJsonContext : JsonSerializerContext
{
}

sealed class NuGetVersionJsonConverter : JsonConverter<NuGetVersion>
{
    public NuGetVersionJsonConverter()
    {
    }

    public override NuGetVersion? Read(ref Utf8JsonReader reader, Type typeToConvert, JsonSerializerOptions options)
    {
        var versionString = reader.GetString();
        if (versionString == null)
            return null;

        if (NuGetVersion.TryParse(versionString, out var version))
        {
            return version;
        }

        throw new JsonException($"Invalid NuGetVersion: '{versionString}'");
    }

    public override void Write(Utf8JsonWriter writer, NuGetVersion value, JsonSerializerOptions options)
    {
        writer.WriteStringValue(value.ToNormalizedString());
    }
}