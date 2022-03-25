cask "dotnet-sdk-3-1-404" do
    version "3.1.404,3.1.10"
    
    url "https://download.visualstudio.microsoft.com/download/pr/fadf4d6d-791a-4312-940b-bde9bd32d5e2/d7ebb3507851711d084075437ce62796/dotnet-sdk-#{version.before_comma}-osx-x64.pkg"
    sha256 "149970eb99f0b31746002e64767766832741c8f57667f36662befcc8f446cec5"
    pkg "dotnet-sdk-3.1.404-osx-x64.pkg"

    name ".NET Core SDK 3.1.404,3.1.10"
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
