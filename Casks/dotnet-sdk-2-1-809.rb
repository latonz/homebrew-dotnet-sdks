cask "dotnet-sdk-2-1-809" do
    version "2.1.809,2.1.21"
    
    url "https://download.visualstudio.microsoft.com/download/pr/1ece43a4-f3e2-4c2d-8423-644d49aae7af/37def46eae1c1ed47e64f9e349ff9aaa/dotnet-sdk-#{version.before_comma}-osx-x64.pkg"
    sha256 "9c6e564cd18c58bfafa1a2b9b98b1d8d9a2a230c9e3e44f31823f4a594d92e1d"
    pkg "dotnet-sdk-2.1.809-osx-x64.pkg"

    name ".NET Core SDK 2.1.809,2.1.21"
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
