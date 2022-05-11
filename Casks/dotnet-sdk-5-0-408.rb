cask "dotnet-sdk-5-0-408" do
    version "5.0.408,5.0.17"
    
    url "https://download.visualstudio.microsoft.com/download/pr/7ed34a57-4da0-4fb3-bd14-614996036744/22215f1d06b49f861f94d760881d6626/dotnet-sdk-#{version.before_comma}-osx-x64.pkg"
    sha256 "ba10d0eb89480b8db37da6945766b167353fa342289c9a92eb102e12b4a25701"
    pkg "dotnet-sdk-5.0.408-osx-x64.pkg"

    name ".NET SDK 5.0.408,5.0.17"
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
