cask "dotnet-sdk-2-1-105" do
    version "2.1.105,2.0.7"
    
    url "https://download.microsoft.com/download/2/E/C/2EC018A0-A0FC-40A2-849D-AA692F68349E/dotnet-sdk-#{version.before_comma}-osx-x64.pkg"
    sha256 "aa075e797b7a382164c0ddcafaf60c40e9e28f213155ebc8da708059e81afcd8"
    pkg "dotnet-sdk-2.1.105-osx-x64.pkg"

    name ".NET Core SDK 2.1.105,2.0.7"
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
