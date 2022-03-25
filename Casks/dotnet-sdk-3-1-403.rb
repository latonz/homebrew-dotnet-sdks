cask "dotnet-sdk-3-1-403" do
    version "3.1.403,3.1.9"
    
    url "https://download.visualstudio.microsoft.com/download/pr/b4db3ee6-91da-4dd3-a279-37c45d9627b7/fad88a7335d374d6e4d53aef085f4b24/dotnet-sdk-#{version.before_comma}-osx-x64.pkg"
    sha256 "6b4f384b8a724bab114e0685285a98003ed21227acfb3c6ff0dc083d981812fc"
    pkg "dotnet-sdk-3.1.403-osx-x64.pkg"

    name ".NET Core SDK 3.1.403,3.1.9"
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
