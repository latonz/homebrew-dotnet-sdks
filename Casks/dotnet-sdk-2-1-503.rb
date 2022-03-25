cask "dotnet-sdk-2-1-503" do
    version "2.1.503,2.1.7"
    
    url "https://download.visualstudio.microsoft.com/download/pr/3df363d4-1824-4b18-8adb-f1c823d617e5/7d8f6c5e91c57e787dfd4a0a15926ee7/dotnet-sdk-#{version.before_comma}-osx-gs-x64.pkg"
    sha256 "458e3252bea76c81c65f30fe3dec20915905b82649ddb225084bd71161f9ccd2"
    pkg "dotnet-sdk-2.1.503-osx-gs-x64.pkg"

    name ".NET Core SDK 2.1.503,2.1.7"
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
