cask "dotnet-sdk-2-1-300" do
    version "2.1.300,2.1.0"
    
    url "https://download.microsoft.com/download/8/8/5/88544F33-836A-49A5-8B67-451C24709A8F/dotnet-sdk-#{version.before_comma}-osx-x64.pkg"
    sha256 "764b6331d9d95ba2440491e25545e42558edfffcb93787b0b3d8d328a1d06113"
    pkg "dotnet-sdk-2.1.300-osx-x64.pkg"

    name ".NET Core SDK 2.1.300,2.1.0"
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
