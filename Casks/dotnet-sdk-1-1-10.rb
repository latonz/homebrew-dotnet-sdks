cask "dotnet-sdk-1-1-10" do
    version "1.1.10,1.1.9"
    
    url "https://download.microsoft.com/download/9/e/6/9e6e1700-f682-4e4c-9e02-583f102cb048/dotnet-dev-osx-x64.#{version.before_comma}.pkg"
    sha256 "9d0ed058a7a2aedcd58f58e62a37368bd57bf4a35ab88d9d2b6d0fe2b2ba2122"
    pkg "dotnet-dev-osx-x64.1.1.10.pkg"

    name ".NET Core SDK 1.1.10,1.1.9"
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
