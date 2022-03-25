cask "dotnet-sdk-3-0-100-preview6-012264" do
    version "3.0.100-preview6-012264,3.0.0-preview6"
    
    url "https://download.visualstudio.microsoft.com/download/pr/e5638e40-46ce-43a6-9de8-5c4d13f9c8f6/4d0be16033dfca7ee7151d0f5d517ce3/dotnet-sdk-#{version.before_comma}-osx-gs-x64.pkg"
    sha256 "109ba444cbce5c284a82292748b959ff59a19194d44dacdd69a316bf5626bb4e"
    pkg "dotnet-sdk-3.0.100-preview6-012264-osx-gs-x64.pkg"

    name ".NET Core SDK 3.0.100-preview6-012264,3.0.0-preview6"
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
