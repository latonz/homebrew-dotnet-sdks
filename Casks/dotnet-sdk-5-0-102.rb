cask "dotnet-sdk-5-0-102" do
    version "5.0.102,5.0.2"
    
    url "https://download.visualstudio.microsoft.com/download/pr/52bd43f7-88c9-420c-80c0-f19bae344293/a8d56f01fdb6f71adb5e22c3ddd1c3c6/dotnet-sdk-#{version.before_comma}-osx-x64.pkg"
    sha256 "0cfca74440da0ba98803547d3eda4a0c3c4152d5fbc69c6d83f2d9b663ac925f"
    pkg "dotnet-sdk-5.0.102-osx-x64.pkg"

    name ".NET SDK 5.0.102,5.0.2"
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
