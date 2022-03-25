cask "dotnet-sdk-3-0-100-rc1-014190" do
    version "3.0.100-rc1-014190,3.0.0-rc1"
    
    url "https://download.visualstudio.microsoft.com/download/pr/0a4b1b26-a6c2-4c6f-b845-f449e5a93cce/e25e43969a5efbc7e7c21d55990c6588/dotnet-sdk-#{version.before_comma}-osx-gs-x64.pkg"
    sha256 "b7695b64b1efe71188ac61a8242b4aa5c115650e0007a2b6c5fb9234f356faa8"
    pkg "dotnet-sdk-3.0.100-rc1-014190-osx-gs-x64.pkg"

    name ".NET Core SDK 3.0.100-rc1-014190,3.0.0-rc1"
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
