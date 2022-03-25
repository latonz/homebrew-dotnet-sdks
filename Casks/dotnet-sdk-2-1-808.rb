cask "dotnet-sdk-2-1-808" do
    version "2.1.808,2.1.20"
    
    url "https://download.visualstudio.microsoft.com/download/pr/6190a306-fbbb-4dcc-82a7-a9e78558602c/884abdcb3990ed4e45659032abc54fab/dotnet-sdk-#{version.before_comma}-osx-x64.pkg"
    sha256 "fe43f9d39a02c6b480bb370dbbd0dbb0a6271a3c0ca497767d0b5cef07a1fce4"
    pkg "dotnet-sdk-2.1.808-osx-x64.pkg"

    name ".NET Core SDK 2.1.808,2.1.20"
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
