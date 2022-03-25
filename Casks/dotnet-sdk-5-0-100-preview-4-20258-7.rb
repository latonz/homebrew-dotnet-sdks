cask "dotnet-sdk-5-0-100-preview-4-20258-7" do
    version "5.0.100-preview.4.20258.7,5.0.0-preview.4"
    
    url "https://download.visualstudio.microsoft.com/download/pr/6d724fad-a67b-4fed-8152-f6f98aff6d63/fdf36e0be9ca9a92af106e27f1f9547e/dotnet-sdk-#{version.before_comma}-osx-x64.pkg"
    sha256 "4c2082a8890c6c961583d9cc4480961b4b8a01271d15b41673e130b08bf44098"
    pkg "dotnet-sdk-5.0.100-preview.4.20258.7-osx-x64.pkg"

    name ".NET SDK 5.0.100-preview.4.20258.7,5.0.0-preview.4"
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
