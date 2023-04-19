#!/usr/bin/env dotnet-script

using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net.Http;
using System.Net.Http.Json;
using System.Security.Cryptography;
using System.Text;
using System.Text.Json;
using System.Text.Json.Serialization;
using System.Threading.Tasks;

const string releaseIndexUrl = "https://raw.githubusercontent.com/dotnet/core/main/release-notes/releases-index.json";
const string intelRuntimeId = "osx-x64";
const string armRuntimeId = "osx-arm64";
const string macOsPkgExt = ".pkg";
const string stateFile = "state.json";

var stateJsonOpts = new JsonSerializerOptions { WriteIndented = true };

var state = await LoadState();
var client = new HttpClient();
var releasesIndex = await client.GetFromJsonAsync<ReleaseIndexList>(releaseIndexUrl);

Log("processing releases after " + state.LatestReleaseDate);

foreach (var releaseIndex in releasesIndex.ReleasesIndex.Where(x => x.LatestReleaseDate > state.LatestReleaseDate))
{
    var releases = await client.GetFromJsonAsync<ReleaseList>(releaseIndex.ReleasesUrl);

    foreach (var release in releases.Releases.Where(x => x.ReleaseDate > state.LatestReleaseDate))
    {
        if (release.Sdk?.Version == null || !state.KnownSdkVersions.Add(release.Sdk.Version))
            continue;

        var sdkFiles = release.Sdk.Files
            .Where(x => x.Rid is armRuntimeId or intelRuntimeId && x.Name?.EndsWith(macOsPkgExt, StringComparison.Ordinal) == true)
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
            IntelVariant = hasIntelSdk ? await BuildVariant(client, release, intelSdkFile) : null,
            ArmVariant = hasArmSdk ? await BuildVariant(client, release, armSdkFile) : null,
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
        return new State
        {
            KnownSdkVersions = new(),
        };
    
    await using var stream = File.OpenRead(stateFile);
    return await JsonSerializer.DeserializeAsync<State>(stream);
}

async Task StoreState(State stateToStore)
{
    await using var stream = File.Create(stateFile);
    await JsonSerializer.SerializeAsync(stream, stateToStore, stateJsonOpts);
}

void Log(string msg) => Console.WriteLine(msg);

async Task<FormulaVariant> BuildVariant(HttpClient client, Release release, ReleaseFile sdkFile)
{
    return new FormulaVariant
    {
        PkgName = sdkFile.Url.Split("/").Last(),
        Sha256 = await ComputeSha256AsHex(client, sdkFile.Url),
        DownloadUrl = sdkFile.Url,
        DownloadUrlWithVersionPlaceholder = sdkFile.Url.Replace(release.Sdk.Version, "#{version.before_comma}"),
    };
}

async Task<string> ComputeSha256AsHex(HttpClient client, string url)
{
    await using var fileStream = await client.GetStreamAsync(url);

    using var hasher = SHA256.Create();
    var hash = await hasher.ComputeHashAsync(fileStream);

    var sb = new StringBuilder(hash.Length * 2);
    foreach (var hashByte in hash)
    {
        sb.Append(hashByte.ToString("x2"));
    }

    return sb.ToString();
}

Task StoreFormula(Formula formula)
{
    Log($"storing formula {formula.Id}");
    var formulaStr = BuildFormula(formula);
    Directory.CreateDirectory(Path.GetDirectoryName(formula.FilePath));
    return File.WriteAllTextAsync(formula.FilePath, formulaStr);
}

string BuildFormula(Formula formula)
{
    return @$"cask ""{formula.Id}"" do
    version ""{formula.SdkVersion},{formula.ReleaseVersion}""
    
    {BuildFormulaVariant(formula)}

    name ""{formula.Product} SDK {formula.SdkVersion},{formula.ReleaseVersion}""
    desc ""Developer platform""
    homepage ""https://www.microsoft.com/net/core#macos""

    conflicts_with cask: [
        ""dotnet-sdk"",
        ""homebrew/cask-versions/dotnet-preview"",
        ""homebrew/cask-versions/dotnet-sdk-preview"",
    ]

    uninstall pkgutil: [
        ""com.microsoft.dotnet.*.#{{version.after_comma}}.*"",
        ""com.microsoft.netstandard.pack.targeting.*.#{{version.after_comma}}.*"",
        ""com.microsoft.dotnet.*.#{{version.before_comma}}.*"",
        ""com.microsoft.netstandard.pack.targeting.*.#{{version.before_comma}}.*"",
    ]

    zap trash: [""~/.dotnet"", ""~/.nuget"", ""/etc/paths.d/dotnet"", ""/etc/paths.d/dotnet-cli-tools""]
end
";
}

string BuildFormulaVariant(Formula formula)
{
    if (formula.IntelVariant != null && formula.ArmVariant != null)
    {
        return @$"if Hardware::CPU.intel?
        {BuildFormulaVariant(formula.IntelVariant, 2)}
    else
        {BuildFormulaVariant(formula.ArmVariant, 2)}
    end";
    }

    return BuildFormulaVariant(formula.IntelVariant ?? formula.ArmVariant, 1);
}

string BuildFormulaVariant(FormulaVariant formulaVariant, int indentLevel)
{
    var indention = string.Join("", Enumerable.Repeat(" ", indentLevel * 4));
    return @$"url ""{formulaVariant.DownloadUrlWithVersionPlaceholder}""
{indention}sha256 ""{formulaVariant.Sha256}""
{indention}pkg ""{formulaVariant.PkgName}""";
}

class State
{
    public HashSet<string> KnownSdkVersions { get; set; }

    public DateTime LatestReleaseDate { get; set; }
}

class Formula
{
    public string Id => $"dotnet-sdk-{ChannelOrSdkVersion.Replace(".", "-")}";

    public string FilePath => Path.GetFullPath(Path.Combine(".", "Casks", Id + ".rb"));

    public string ChannelOrSdkVersion => Channel ?? SdkVersion;

    public string Channel { get; set; }
    
    public string SdkVersion { get; set; }

    /// <summary>
    /// Gets or sets the release version.
    /// <example></example>
    /// </summary>
    public string ReleaseVersion { get; set; }
    
    /// <summary>
    /// Gets or sets the product.
    /// <example>.NET</example>
    /// <example>.NET Core</example>
    /// </summary>
    public string Product { get; set; }

    public FormulaVariant IntelVariant { get; set; }

    public FormulaVariant ArmVariant { get; set; }
}

class FormulaVariant
{
    /// <summary>
    /// Gets or sets the name of the installer incl. the extension.
    /// <example>dotnet-sdk-5.0.300-osx-x64.pkg</example>
    /// </summary>
    public string PkgName { get; set; }

    /// <summary>
    /// Gets or sets the sha256 as a hex string.
    /// </summary>
    public string Sha256 { get; set; }

    public string DownloadUrl { get; set; }

    public string DownloadUrlWithVersionPlaceholder { get; set; }
}

class ReleaseIndexList
{
    [JsonPropertyName("releases-index")]
    public List<ReleaseIndex> ReleasesIndex { get; set; }
}

class ReleaseIndex
{
    public string Product { get; set; }

    [JsonPropertyName("latest-release-date")]
    public DateTime LatestReleaseDate { get; set; }

    [JsonPropertyName("releases.json")]
    public string ReleasesUrl { get; set; }
}

class ReleaseList
{
    [JsonPropertyName("channel-version")]
    public string ChannelVersion { get; set; }

    [JsonPropertyName("latest-sdk")]
    public string LatestSdk { get; set; }

    public List<Release> Releases { get; set; }
}

class Release
{
    [JsonPropertyName("release-date")]
    public DateTime ReleaseDate { get; set; }

    [JsonPropertyName("release-version")]
    public string ReleaseVersion { get; set; }

    public SdkRelease Sdk { get; set; }
}

class SdkRelease
{
    public string Version { get; set; }
    public List<ReleaseFile> Files { get; set; }
}

class ReleaseFile
{
    public string Name { get; set; }

    public string Rid { get; set; }

    public string Url { get; set; }

    // we cannot use the provided hash since its sha512
    // but homebrew requires sha256
}
