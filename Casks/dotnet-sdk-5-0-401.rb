cask "dotnet-sdk-5-0-401" do
    version "5.0.401,5.0.10"
    
    url "https://download.visualstudio.microsoft.com/download/pr/846d5680-b804-4903-8d8d-255804bcfaeb/436101afc96998f75efb452f5ded3c1a/dotnet-sdk-#{version.before_comma}-osx-x64.pkg"
    sha256 "fe93ad11180f6d482832a846f982f439173dafeed7ffe2747c2ca270cbc63b63"
    pkg "dotnet-sdk-5.0.401-osx-x64.pkg"

    name ".NET SDK 5.0.401,5.0.10"
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
