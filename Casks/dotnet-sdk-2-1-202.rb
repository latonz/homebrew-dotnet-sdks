cask "dotnet-sdk-2-1-202" do
    version "2.1.202,2.0.9"
    
    url "https://download.microsoft.com/download/f/c/1/fc16c864-b374-4668-83a2-f9f880928b2d/dotnet-sdk-#{version.before_comma}-osx-x64.pkg"
    sha256 "52031e7f6e493468e6a56a9172c847f02c9858bceebcdad85c95687ed98a930c"
    pkg "dotnet-sdk-2.1.202-osx-x64.pkg"

    name ".NET Core SDK 2.1.202,2.0.9"
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
