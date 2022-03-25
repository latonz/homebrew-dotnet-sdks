cask "dotnet-sdk-5-0-406" do
    version "5.0.406,5.0.15"
    
    url "https://download.visualstudio.microsoft.com/download/pr/045ed34f-4b45-4b3f-8eb4-030995b418f8/2447384cc7e66980d8a4cfb55f792e83/dotnet-sdk-#{version.before_comma}-osx-x64.pkg"
    sha256 "b9e56be878a932d59b53fcf7d7d8811b3e21af33b494e03b1e3152646c03519b"
    pkg "dotnet-sdk-5.0.406-osx-x64.pkg"

    name ".NET SDK 5.0.406,5.0.15"
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
