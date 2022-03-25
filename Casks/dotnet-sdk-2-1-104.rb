cask "dotnet-sdk-2-1-104" do
    version "2.1.104,2.1.104"
    
    url "https://download.microsoft.com/download/D/8/1/D8131218-F121-4E13-8C5F-39B09A36E406/dotnet-sdk-#{version.before_comma}-osx-x64.pkg"
    sha256 "54a07c879840d0e34529f4b83a6323e6bbdf88f7347564f8d53f94e5d684e3c4"
    pkg "dotnet-sdk-2.1.104-osx-x64.pkg"

    name ".NET Core SDK 2.1.104,2.1.104"
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
