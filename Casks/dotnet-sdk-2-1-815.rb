cask "dotnet-sdk-2-1-815" do
    version "2.1.815,2.1.27"
    
    url "https://download.visualstudio.microsoft.com/download/pr/48fa767a-4e0d-4d53-bd81-b931061b58e5/446f7ebcd5d20906d34cd6d1bc53f2d4/dotnet-sdk-#{version.before_comma}-osx-x64.pkg"
    sha256 "424e9a5f1ed30a74c67326e5fd9e6a81b25ef91e26f0589f73bbe2b322858274"
    pkg "dotnet-sdk-2.1.815-osx-x64.pkg"

    name ".NET Core SDK 2.1.815,2.1.27"
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
