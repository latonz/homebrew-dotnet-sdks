cask "dotnet-sdk-2-1-4" do
    version "2.1.4,2.0.5"
    
    url "https://download.microsoft.com/download/1/1/5/115B762D-2B41-4AF3-9A63-92D9680B9409/dotnet-sdk-#{version.before_comma}-osx-x64.pkg"
    sha256 "c156cdc461a21830c8283635595c22aef78103e9b4ab80ae4f42cba7473baa2f"
    pkg "dotnet-sdk-2.1.4-osx-x64.pkg"

    name ".NET Core SDK 2.1.4,2.0.5"
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
