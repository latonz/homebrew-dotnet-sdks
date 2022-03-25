cask "dotnet-sdk-2-2-102" do
    version "2.2.102,2.2.1"
    
    url "https://download.visualstudio.microsoft.com/download/pr/6d678659-691d-4e02-8896-2d297e0e8e57/bb9201b72a621690aec60f51e6b8e6ab/dotnet-sdk-#{version.before_comma}-osx-gs-x64.pkg"
    sha256 "0f372cedaffe87b88f4aebbd1bab4b31b33b40f2390b2ba6fd3e6b1217ba6b79"
    pkg "dotnet-sdk-2.2.102-osx-gs-x64.pkg"

    name ".NET Core SDK 2.2.102,2.2.1"
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
