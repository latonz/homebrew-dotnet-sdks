cask "dotnet-sdk-3-1-406" do
    version "3.1.406,3.1.12"
    
    url "https://download.visualstudio.microsoft.com/download/pr/0b119bb9-4be3-4ea1-9702-529a70339af0/84aeed5be73b8873d7e7eafb323e955e/dotnet-sdk-#{version.before_comma}-osx-x64.pkg"
    sha256 "122741c75e0b005059dcbed827806a7cfe716e26d121a1fc5592b7bd789b9955"
    pkg "dotnet-sdk-3.1.406-osx-x64.pkg"

    name ".NET Core SDK 3.1.406,3.1.12"
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
