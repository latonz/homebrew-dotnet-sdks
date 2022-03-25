cask "dotnet-sdk-3-1-401" do
    version "3.1.401,3.1.7"
    
    url "https://download.visualstudio.microsoft.com/download/pr/692921be-5cd6-42b5-8c52-0c17cb5ec580/1b0d95cd4950a58ac069095bdf976f6e/dotnet-sdk-#{version.before_comma}-osx-x64.pkg"
    sha256 "34361a0370fe4da5ce2e853e18d74f09612bb7de879a5e491e724cf9fc51edef"
    pkg "dotnet-sdk-3.1.401-osx-x64.pkg"

    name ".NET Core SDK 3.1.401,3.1.7"
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
