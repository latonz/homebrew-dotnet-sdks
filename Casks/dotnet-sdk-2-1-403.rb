cask "dotnet-sdk-2-1-403" do
    version "2.1.403,2.1.5"
    
    url "https://download.visualstudio.microsoft.com/download/pr/38102737-cb48-46c2-8f52-fb7102b50ae7/d81958d71c3c2679796e1ecfbd9cc903/dotnet-sdk-#{version.before_comma}-osx-x64.pkg"
    sha256 "d290cefddb4fbdf1215724c049d86b4ce09f5dc2c5a658e3c1645c368f34c31a"
    pkg "dotnet-sdk-2.1.403-osx-x64.pkg"

    name ".NET Core SDK 2.1.403,2.1.5"
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
