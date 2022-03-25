cask "dotnet-sdk-2-2-101" do
    version "2.2.101,2.2.101"
    
    url "https://download.visualstudio.microsoft.com/download/pr/b0d39717-6bda-4d1b-9cb7-e782a9a87f0c/f68bddee81da14befb036a3d17351c3e/dotnet-sdk-#{version.before_comma}-osx-gs-x64.pkg"
    sha256 "6057b663031960c5e72e8e81d23610a70a091ef744daffce3a2a101a2e37e161"
    pkg "dotnet-sdk-2.2.101-osx-gs-x64.pkg"

    name ".NET Core SDK 2.2.101,2.2.101"
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
