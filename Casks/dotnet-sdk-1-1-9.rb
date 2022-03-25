cask "dotnet-sdk-1-1-9" do
    version "1.1.9,1.1.8"
    
    url "https://download.microsoft.com/download/4/0/2/4022CFC7-5061-4762-B9BA-48B35632572D/dotnet-dev-osx-x64.#{version.before_comma}.pkg"
    sha256 "413d3feb5ffa817df9d07025b6c28279c7e143697739d4bd2e5a37cd8e140905"
    pkg "dotnet-dev-osx-x64.1.1.9.pkg"

    name ".NET Core SDK 1.1.9,1.1.8"
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
