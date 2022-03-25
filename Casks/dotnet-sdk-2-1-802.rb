cask "dotnet-sdk-2-1-802" do
    version "2.1.802,2.1.13"
    
    url "https://download.visualstudio.microsoft.com/download/pr/3998e58a-46dd-4f9c-a0e2-d17309de20fb/d694ddf3d8f99e8dee928e0b46f15084/dotnet-sdk-#{version.before_comma}-osx-x64.pkg"
    sha256 "a2d4b58d3893af102a505fd0522a2f7138bf09783ca1a3dab870fc1cc12bfdc1"
    pkg "dotnet-sdk-2.1.802-osx-x64.pkg"

    name ".NET Core SDK 2.1.802,2.1.13"
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
