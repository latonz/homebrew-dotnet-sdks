cask "dotnet-sdk-2-2-106" do
    version "2.2.106,2.2.4"
    
    url "https://download.visualstudio.microsoft.com/download/pr/3016849c-82af-433f-afc3-78f0e5d087aa/cd7232c238c583570ed8d60dd00324e5/dotnet-sdk-#{version.before_comma}-osx-gs-x64.pkg"
    sha256 "b37c72440be563faca0a6044354c73bff67d55e20ab662d1c56cc9c21d27ffc7"
    pkg "dotnet-sdk-2.2.106-osx-gs-x64.pkg"

    name ".NET Core SDK 2.2.106,2.2.4"
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
