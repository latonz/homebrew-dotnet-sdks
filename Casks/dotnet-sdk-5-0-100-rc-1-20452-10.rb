cask "dotnet-sdk-5-0-100-rc-1-20452-10" do
    version "5.0.100-rc.1.20452.10,5.0.0-rc.1"
    
    url "https://download.visualstudio.microsoft.com/download/pr/288c8d33-c0e0-4ab2-a9c0-7278f4e2490f/68c2c7c6e1d971d29caa12302e9352cf/dotnet-sdk-#{version.before_comma}-osx-x64.pkg"
    sha256 "02a4954e933ef9bb782940f44ae83f8506589acb5605408a8ce67ecbe8628135"
    pkg "dotnet-sdk-5.0.100-rc.1.20452.10-osx-x64.pkg"

    name ".NET SDK 5.0.100-rc.1.20452.10,5.0.0-rc.1"
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
