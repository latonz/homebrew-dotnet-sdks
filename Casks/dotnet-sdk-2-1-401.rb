cask "dotnet-sdk-2-1-401" do
    version "2.1.401,2.1.3"
    
    url "https://download.microsoft.com/download/E/8/A/E8AF2EE0-5DDA-4420-A395-D1A50EEFD83E/dotnet-sdk-#{version.before_comma}-osx-x64.pkg"
    sha256 "83af1dc6fdcf9847b7e27d0b6eb8272b0319d72380c6a2c0a87cc29b2978b390"
    pkg "dotnet-sdk-2.1.401-osx-x64.pkg"

    name ".NET Core SDK 2.1.401,2.1.3"
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
