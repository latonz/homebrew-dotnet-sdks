cask "dotnet-sdk-2-2-105" do
    version "2.2.105,2.2.3"
    
    url "https://download.visualstudio.microsoft.com/download/pr/a4b4e61e-0905-4eb8-9d2c-9f5f390312e7/e1edac05922be70b51007739ed0db49e/dotnet-sdk-#{version.before_comma}-osx-gs-x64.pkg"
    sha256 "6e2ef0410cf22f88e6fe5dd5dc898aeb6c5e4162d99600e9e2c4d486f11b685c"
    pkg "dotnet-sdk-2.2.105-osx-gs-x64.pkg"

    name ".NET Core SDK 2.2.105,2.2.3"
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
