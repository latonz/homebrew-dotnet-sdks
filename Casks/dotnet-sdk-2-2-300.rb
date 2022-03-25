cask "dotnet-sdk-2-2-300" do
    version "2.2.300,2.2.300"
    
    url "https://download.visualstudio.microsoft.com/download/pr/0cc790f8-f0b6-438a-a8c8-f734e5709590/8fb91e7ef7a43a8509eeaab6785a4c14/dotnet-sdk-#{version.before_comma}-osx-gs-x64.pkg"
    sha256 "f7ba19f3f30af6db1e9fb760ac9f9e7d1ce7acb1c204223a1c1bae02cbab493a"
    pkg "dotnet-sdk-2.2.300-osx-gs-x64.pkg"

    name ".NET Core SDK 2.2.300,2.2.300"
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
