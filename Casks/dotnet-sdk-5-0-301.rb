cask "dotnet-sdk-5-0-301" do
    version "5.0.301,5.0.7"
    
    url "https://download.visualstudio.microsoft.com/download/pr/365bc017-ae76-4e58-a8ec-98ba365fa74b/bd816059b3a043d913e56b707347db21/dotnet-sdk-#{version.before_comma}-osx-x64.pkg"
    sha256 "5c5f929722d974b74177e5c01d08423297f2b81fdd65dcc3b84d03cb9e682266"
    pkg "dotnet-sdk-5.0.301-osx-x64.pkg"

    name ".NET SDK 5.0.301,5.0.7"
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
