cask "dotnet-sdk-2-2-401" do
    version "2.2.401,2.2.6"
    
    url "https://download.visualstudio.microsoft.com/download/pr/1045a7f9-5585-49b6-a138-34717f2a7e9f/bd24b2ba41dfcd0a8ec8271caa6f38e4/dotnet-sdk-#{version.before_comma}-osx-gs-x64.pkg"
    sha256 "fe597fa739bbad9b1a1165f18a5c99b2e7157d6095be187445d3cfc829012965"
    pkg "dotnet-sdk-2.2.401-osx-gs-x64.pkg"

    name ".NET Core SDK 2.2.401,2.2.6"
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
