cask "dotnet-sdk-3-1-424" do
    version "3.1.424,3.1.30"
    
    url "https://download.visualstudio.microsoft.com/download/pr/0196b062-8cbf-448b-a3ea-feee21c2b4da/7b15b845099274b2f046af149e594f00/dotnet-sdk-#{version.before_comma}-osx-x64.pkg"
    sha256 "ae9587a21bdb77ab4d704ef250526c9cb0e6bab78deb0996f1a324e23692c0b2"
    pkg "dotnet-sdk-3.1.424-osx-x64.pkg"

    name ".NET Core SDK 3.1.424,3.1.30"
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
