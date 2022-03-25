cask "dotnet-sdk-2-1-100" do
    version "2.1.100,2.1.100"
    
    url "https://download.microsoft.com/download/2/A/2/2A21B61D-4D08-4E25-AB4A-7B9859300B0C/dotnet-sdk-#{version.before_comma}-osx-x64.pkg"
    sha256 "fcccecc14378b572d43a34868210a5c041f8657f8c68ea5196ec4cda4c64e963"
    pkg "dotnet-sdk-2.1.100-osx-x64.pkg"

    name ".NET Core SDK 2.1.100,2.1.100"
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
