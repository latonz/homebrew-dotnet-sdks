cask "dotnet-sdk-3-0-100-preview7-012821" do
    version "3.0.100-preview7-012821,3.0.0-preview7"
    
    url "https://download.visualstudio.microsoft.com/download/pr/64c5239c-620c-4613-b4a4-0ce34952bf48/fbe397790bf9b93b9637017965a336f4/dotnet-sdk-#{version.before_comma}-osx-gs-x64.pkg"
    sha256 "44de66897f4f5a1991e46d6e4689682067a5bef1cd1b28827bc70fd095547f40"
    pkg "dotnet-sdk-3.0.100-preview7-012821-osx-gs-x64.pkg"

    name ".NET Core SDK 3.0.100-preview7-012821,3.0.0-preview7"
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
