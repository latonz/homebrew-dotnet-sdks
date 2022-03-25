cask "dotnet-sdk-2-1-812" do
    version "2.1.812,2.1.24"
    
    url "https://download.visualstudio.microsoft.com/download/pr/f5fc0218-400d-4236-9f3a-bc9f9aaa9054/b22f76aa4cd9d9dc9fb633f1d8ad67af/dotnet-sdk-#{version.before_comma}-osx-x64.pkg"
    sha256 "949a7bf582f656b18d49a8c9bd76e645201acc1a6444e3bd6d6710b2b4378348"
    pkg "dotnet-sdk-2.1.812-osx-x64.pkg"

    name ".NET Core SDK 2.1.812,2.1.24"
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
