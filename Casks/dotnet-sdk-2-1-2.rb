cask "dotnet-sdk-2-1-2" do
    version "2.1.2,2.0.3"
    
    url "https://download.microsoft.com/download/5/D/F/5DF4B836-7DFD-4CCF-AC96-101E2A4C7421/dotnet-sdk-#{version.before_comma}-osx-x64.pkg"
    sha256 "822201fa6ef0c053a97a805b6d66abba2304a2b9c6db9228d9a7f0818ebad252"
    pkg "dotnet-sdk-2.1.2-osx-x64.pkg"

    name ".NET Core SDK 2.1.2,2.0.3"
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
