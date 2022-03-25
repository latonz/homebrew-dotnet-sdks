cask "dotnet-sdk-2-1-602" do
    version "2.1.602,2.1.602"
    
    url "https://download.visualstudio.microsoft.com/download/pr/91cdc233-303f-4717-939c-272635f4bc0d/e05447acb728ed2a21f6b13e4ebbfa58/dotnet-sdk-#{version.before_comma}-osx-gs-x64.pkg"
    sha256 "641f7e0670fd0cd2b6ce040d9af11e8f93ada02807ed2ef0d97bbe6389161e29"
    pkg "dotnet-sdk-2.1.602-osx-gs-x64.pkg"

    name ".NET Core SDK 2.1.602,2.1.602"
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
