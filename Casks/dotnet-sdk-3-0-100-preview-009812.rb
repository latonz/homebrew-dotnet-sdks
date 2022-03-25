cask "dotnet-sdk-3-0-100-preview-009812" do
    version "3.0.100-preview-009812,3.0.0-preview1"
    
    url "https://download.visualstudio.microsoft.com/download/pr/f97c1f65-a021-4778-8c84-cc8305c49ac3/12c1ebf85f15551987682860d9dec0be/dotnet-sdk-#{version.before_comma}-osx-gs-x64.pkg"
    sha256 "87bf32be80cd24a9086f82adcf0d9fe698ab6e45957657feb8ef409fa61923b4"
    pkg "dotnet-sdk-3.0.100-preview-009812-osx-gs-x64.pkg"

    name ".NET Core SDK 3.0.100-preview-009812,3.0.0-preview1"
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
