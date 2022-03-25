cask "dotnet-sdk-1-1-12" do
    version "1.1.12,1.1.11"
    
    url "https://download.visualstudio.microsoft.com/download/pr/88dddec3-3f0d-4ee9-acdd-0b63953662ec/4f20e4ddf864a685b7bea02ad83b5a0d/dotnet-dev-osx-x64.#{version.before_comma}.pkg"
    sha256 "46b1fb3a01e0cdfc7822949a5cfb82337c240b6ef9583bd1541234a1d4611a78"
    pkg "dotnet-dev-osx-x64.1.1.12.pkg"

    name ".NET Core SDK 1.1.12,1.1.11"
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
