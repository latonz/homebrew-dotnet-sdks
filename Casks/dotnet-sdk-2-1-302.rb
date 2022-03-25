cask "dotnet-sdk-2-1-302" do
    version "2.1.302,2.1.2"
    
    url "https://download.microsoft.com/download/4/0/9/40920432-3302-47a8-b13c-bbc4848ad114/dotnet-sdk-#{version.before_comma}-osx-x64.pkg"
    sha256 "89c1a7b089d4bc12e9a70190ef5dcfc3cc82192ce7a4e6c5e3c7c2e647c55eaf"
    pkg "dotnet-sdk-2.1.302-osx-x64.pkg"

    name ".NET Core SDK 2.1.302,2.1.2"
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
