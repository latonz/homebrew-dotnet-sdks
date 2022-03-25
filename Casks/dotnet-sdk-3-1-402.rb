cask "dotnet-sdk-3-1-402" do
    version "3.1.402,3.1.8"
    
    url "https://download.visualstudio.microsoft.com/download/pr/340e6cc2-cce5-44ad-aab6-012233d90aa7/265cf15bcbe10fb8445060f792e48bf9/dotnet-sdk-#{version.before_comma}-osx-x64.pkg"
    sha256 "76c34d468e28ae3419186cc7711563b591c9d25dfa9a441960e56cc9af4bbe79"
    pkg "dotnet-sdk-3.1.402-osx-x64.pkg"

    name ".NET Core SDK 3.1.402,3.1.8"
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
