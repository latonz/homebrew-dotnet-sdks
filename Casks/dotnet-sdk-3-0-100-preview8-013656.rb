cask "dotnet-sdk-3-0-100-preview8-013656" do
    version "3.0.100-preview8-013656,3.0.0-preview8"
    
    url "https://download.visualstudio.microsoft.com/download/pr/faf7de64-b807-4eb4-a3c0-dcdaceab5bea/f68c9a083b7bb4eadd38f813e4a2b89a/dotnet-sdk-#{version.before_comma}-osx-gs-x64.pkg"
    sha256 "e4af81bf738ef6c4125e9c29dafdb17daa4e1f5c5095e7c1e33c883ba62ddf85"
    pkg "dotnet-sdk-3.0.100-preview8-013656-osx-gs-x64.pkg"

    name ".NET Core SDK 3.0.100-preview8-013656,3.0.0-preview8"
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

    zap trash: ["~/.dotnet", "~/.nuget"]
end
