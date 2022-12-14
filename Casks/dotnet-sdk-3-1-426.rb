cask "dotnet-sdk-3-1-426" do
    version "3.1.426,3.1.32"
    
    url "https://download.visualstudio.microsoft.com/download/pr/c319dd8b-4ea5-473e-8609-c36f31c8186e/c9633afb3084888a8c62fa224512050b/dotnet-sdk-#{version.before_comma}-osx-x64.pkg"
    sha256 "ee2451eb09254e90f4c4e779d4e148d81313bbbe5d61280665ffbf89b5a4ad25"
    pkg "dotnet-sdk-3.1.426-osx-x64.pkg"

    name ".NET Core SDK 3.1.426,3.1.32"
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
