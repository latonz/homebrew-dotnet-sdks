cask "dotnet-sdk-2-1-604" do
    version "2.1.604,2.1.604"
    
    url "https://download.visualstudio.microsoft.com/download/pr/870ae384-4933-47c9-8f75-096ebaa1f75b/2335665b86b9dd49e6040f82fdc2695f/dotnet-sdk-#{version.before_comma}-osx-gs-x64.pkg"
    sha256 "aec7ac1d50f88310d86a60b25947e3512cf471b1ab774487ac675e7de5bd1a23"
    pkg "dotnet-sdk-2.1.604-osx-gs-x64.pkg"

    name ".NET Core SDK 2.1.604,2.1.604"
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
