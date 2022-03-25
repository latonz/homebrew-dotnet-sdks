cask "dotnet-sdk-3-1-101" do
    version "3.1.101,3.1.1"
    
    url "https://download.visualstudio.microsoft.com/download/pr/749db4bc-73c3-4ffb-a545-c315dc9a0ca8/5281258f5dcae636efe557b8b305e20b/dotnet-sdk-#{version.before_comma}-osx-x64.pkg"
    sha256 "89c9a9bbc50c15d3873b87e9c030b85a2021a8c4e881c8b86d718164970f7d2b"
    pkg "dotnet-sdk-3.1.101-osx-x64.pkg"

    name ".NET Core SDK 3.1.101,3.1.1"
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
