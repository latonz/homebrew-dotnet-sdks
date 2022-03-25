cask "dotnet-sdk-2-1-402" do
    version "2.1.402,2.1.4"
    
    url "https://download.microsoft.com/download/8/A/7/8A765126-50CA-4C6F-890B-19AE47961E4B/dotnet-sdk-#{version.before_comma}-osx-x64.pkg"
    sha256 "f5b6f230395735a8c31cae7f01d43f61bd3227082d7bc3555a91cebcd0deb9db"
    pkg "dotnet-sdk-2.1.402-osx-x64.pkg"

    name ".NET Core SDK 2.1.402,2.1.4"
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
