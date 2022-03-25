cask "dotnet-sdk-5-0-100-preview-1-20155-7" do
    version "5.0.100-preview.1.20155.7,5.0.0-preview.1"
    
    url "https://download.visualstudio.microsoft.com/download/pr/f262d833-69d3-4aa1-bac1-b32075bebed3/474be39cca68cd46d3dc2cc03188f217/dotnet-sdk-#{version.before_comma}-osx-x64.pkg"
    sha256 "125bbbc2aea7d6caf2359a0e6ad4ee410a9accd2a316e76e06728c213f122496"
    pkg "dotnet-sdk-5.0.100-preview.1.20155.7-osx-x64.pkg"

    name ".NET SDK 5.0.100-preview.1.20155.7,5.0.0-preview.1"
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
