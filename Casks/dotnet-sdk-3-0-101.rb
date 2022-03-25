cask "dotnet-sdk-3-0-101" do
    version "3.0.101,3.0.1"
    
    url "https://download.visualstudio.microsoft.com/download/pr/fb3f4f38-99cd-4d24-a707-b64f8fdd9aae/11900d0b5d14d62bfa4b058dfd505bdb/dotnet-sdk-#{version.before_comma}-osx-gs-x64.pkg"
    sha256 "9d40f99047c2713efcf48c67c80b3bac0fcd24c87bdf7263b8e37e3bdf9901e9"
    pkg "dotnet-sdk-3.0.101-osx-gs-x64.pkg"

    name ".NET Core SDK 3.0.101,3.0.1"
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
