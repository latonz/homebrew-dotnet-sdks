cask "dotnet-sdk-5-0-100" do
    version "5.0.100,5.0.0"
    
    url "https://download.visualstudio.microsoft.com/download/pr/3bdcd7d2-1444-4f7d-a254-504a994ffe39/e4f42b83604673f971748c722aa20bec/dotnet-sdk-#{version.before_comma}-osx-x64.pkg"
    sha256 "8f601ad822d9abb2f96a81f6a949629c46c7416d67ab55decbf358ffa5fc8deb"
    pkg "dotnet-sdk-5.0.100-osx-x64.pkg"

    name ".NET SDK 5.0.100,5.0.0"
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
