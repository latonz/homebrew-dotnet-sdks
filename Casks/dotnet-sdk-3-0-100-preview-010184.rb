cask "dotnet-sdk-3-0-100-preview-010184" do
    version "3.0.100-preview-010184,3.0.0-preview2"
    
    url "https://download.visualstudio.microsoft.com/download/pr/60046b90-03b4-4332-bc4b-0d09cc1a21c2/d9c6632f9ae6ad3bf5305c20566b9a0d/dotnet-sdk-#{version.before_comma}-osx-gs-x64.pkg"
    sha256 "d358732afb8f6a354a020e5446e71c9546eb912888f950aebc60232cd0658c2f"
    pkg "dotnet-sdk-3.0.100-preview-010184-osx-gs-x64.pkg"

    name ".NET Core SDK 3.0.100-preview-010184,3.0.0-preview2"
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
