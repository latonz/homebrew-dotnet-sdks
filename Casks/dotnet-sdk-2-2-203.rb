cask "dotnet-sdk-2-2-203" do
    version "2.2.203,2.2.203"
    
    url "https://download.visualstudio.microsoft.com/download/pr/e806668f-6825-4754-9d3d-7a2c1c45304a/ee61a77eaf402ccb14c41f7bb10b6e94/dotnet-sdk-#{version.before_comma}-osx-gs-x64.pkg"
    sha256 "e1f01d7bfa454d1f7b66cb59d9c13c5bf891071e36ff1ddc2029faf3a54514fe"
    pkg "dotnet-sdk-2.2.203-osx-gs-x64.pkg"

    name ".NET Core SDK 2.2.203,2.2.203"
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
