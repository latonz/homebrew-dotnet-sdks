cask "dotnet-sdk-6-0-410" do
    version "6.0.410,6.0.18"
    
    if Hardware::CPU.intel?
        url "https://download.visualstudio.microsoft.com/download/pr/a3e893be-f18b-4e66-82e8-7c8ed885656d/3418460dc778e8e496b578b93d7df141/dotnet-sdk-#{version.before_comma}-osx-x64.pkg"
        sha256 "c1a2a62f75b58614b72cc7239de97276b924a31544745fc09bf4d0d3467465a1"
        pkg "dotnet-sdk-6.0.410-osx-x64.pkg"
    else
        url "https://download.visualstudio.microsoft.com/download/pr/983c585a-6e22-458f-8632-f0f97b687ca8/8250a113e906e443c904e9cf72f118b9/dotnet-sdk-#{version.before_comma}-osx-arm64.pkg"
        sha256 "cb2aaf2a78050e0a7f906df045707cd2c0f2d76f2b3fe3e6d8c172ca76f20537"
        pkg "dotnet-sdk-6.0.410-osx-arm64.pkg"
    end

    name ".NET SDK 6.0.410,6.0.18"
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

    zap trash: ["~/.dotnet", "~/.nuget", "/etc/paths.d/dotnet", "/etc/paths.d/dotnet-cli-tools"]
end
