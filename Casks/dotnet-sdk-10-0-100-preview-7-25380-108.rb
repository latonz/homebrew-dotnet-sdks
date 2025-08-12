cask "dotnet-sdk-10-0-100-preview-7-25380-108" do
    version "10.0.100-preview.7.25380.108,10.0.0-preview.7"
    
    if Hardware::CPU.intel?
        url "https://builds.dotnet.microsoft.com/dotnet/Sdk/#{version.before_comma}/dotnet-sdk-#{version.before_comma}-osx-x64.pkg"
        sha256 "63E9F6B70AD8F947AA36DB959E490C90054D3EE9AFF58F73C913B0CA59CD96F6"
        pkg "dotnet-sdk-10.0.100-preview.7.25380.108-osx-x64.pkg"
    else
        url "https://builds.dotnet.microsoft.com/dotnet/Sdk/#{version.before_comma}/dotnet-sdk-#{version.before_comma}-osx-arm64.pkg"
        sha256 "F4AA82CB724114A87E0296EB197D0ABE4E3762F531D82A297E3AE747453F647D"
        pkg "dotnet-sdk-10.0.100-preview.7.25380.108-osx-arm64.pkg"
    end

    name ".NET SDK 10.0.100-preview.7.25380.108,10.0.0-preview.7"
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