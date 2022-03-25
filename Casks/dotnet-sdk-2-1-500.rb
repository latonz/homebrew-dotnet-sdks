cask "dotnet-sdk-2-1-500" do
    version "2.1.500,2.1.6"
    
    url "https://download.visualstudio.microsoft.com/download/pr/59a7b78f-4e86-473b-b230-c84d15505cec/766e3e5f35e7bb9677dd785071c5fbf7/dotnet-sdk-#{version.before_comma}-osx-x64.pkg"
    sha256 "897de45f5764c3efb9a35d225eb668d355f24c34920a26a1310115658fee3283"
    pkg "dotnet-sdk-2.1.500-osx-x64.pkg"

    name ".NET Core SDK 2.1.500,2.1.6"
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
