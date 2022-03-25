cask "dotnet-sdk-2-0-0" do
    version "2.0.0,2.0.0"
    
    url "https://download.microsoft.com/download/0/F/D/0FD852A4-7EA1-4E2A-983A-0484AC19B92C/dotnet-sdk-#{version.before_comma}-osx-x64.pkg"
    sha256 "69300051d696f5ae8e42bd79e5aa13a08116723d79c324fd248df7ead2869291"
    pkg "dotnet-sdk-2.0.0-osx-x64.pkg"

    name ".NET Core SDK 2.0.0,2.0.0"
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
