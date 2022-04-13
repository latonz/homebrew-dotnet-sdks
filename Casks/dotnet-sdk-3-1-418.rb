cask "dotnet-sdk-3-1-418" do
    version "3.1.418,3.1.24"
    
    url "https://download.visualstudio.microsoft.com/download/pr/f17f207a-238e-4694-bb47-07390495be24/635ab97f7f0e24e444b6f2be58f616e8/dotnet-sdk-#{version.before_comma}-osx-x64.pkg"
    sha256 "5dfbaca46231c3bfae6a1493b98893fd9dbebd178678774b82040c936d413f84"
    pkg "dotnet-sdk-3.1.418-osx-x64.pkg"

    name ".NET Core SDK 3.1.418,3.1.24"
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
