cask "dotnet-sdk-2-2-104" do
    version "2.2.104,2.2.2"
    
    url "https://download.visualstudio.microsoft.com/download/pr/3fb2ae01-c8c5-4d0a-9102-31c8c3386bc5/94b144257db9c52405d7f7e03adc31a9/dotnet-sdk-#{version.before_comma}-osx-gs-x64.pkg"
    sha256 "4494b2084d6fba0e7e708faee1237b3a596bc6030cdb81579a24df85ec651d72"
    pkg "dotnet-sdk-2.2.104-osx-gs-x64.pkg"

    name ".NET Core SDK 2.2.104,2.2.2"
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
