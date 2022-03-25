cask "dotnet-sdk-3-1-416" do
    version "3.1.416,3.1.22"
    
    url "https://download.visualstudio.microsoft.com/download/pr/2dc016eb-cb93-4bdf-98c0-ee8c84ad26c0/d1a7eb02814ac9e164cb0e23c24d5973/dotnet-sdk-#{version.before_comma}-osx-x64.pkg"
    sha256 "6db22c5c550de8d35e3968b008418d00a30fadd5419f44ff6810c73a2e98a861"
    pkg "dotnet-sdk-3.1.416-osx-x64.pkg"

    name ".NET Core SDK 3.1.416,3.1.22"
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
