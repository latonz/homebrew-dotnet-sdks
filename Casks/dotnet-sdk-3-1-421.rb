cask "dotnet-sdk-3-1-421" do
    version "3.1.421,3.1.27"
    
    url "https://download.visualstudio.microsoft.com/download/pr/6b3a6c1a-17c7-4eb4-94ce-596eab8fe120/e4552bf7c2b80df104820530f69770bd/dotnet-sdk-#{version.before_comma}-osx-x64.pkg"
    sha256 "721f58d8a0044773740b3f828dc90958b3ab3b9ac24ea9f6a3d369c73f621b7b"
    pkg "dotnet-sdk-3.1.421-osx-x64.pkg"

    name ".NET Core SDK 3.1.421,3.1.27"
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
