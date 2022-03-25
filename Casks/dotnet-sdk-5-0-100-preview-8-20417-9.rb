cask "dotnet-sdk-5-0-100-preview-8-20417-9" do
    version "5.0.100-preview.8.20417.9,5.0.0-preview.8"
    
    url "https://download.visualstudio.microsoft.com/download/pr/6ff7a8f6-9e28-46bc-8d0d-f7fbc2c13a59/1c576dee55c50ce071c0b7bb504906aa/dotnet-sdk-#{version.before_comma}-osx-x64.pkg"
    sha256 "5e2a21820dd6dbbe81bb1d69e4fafe8c1a62a3be8f85e4d3a9f34d0ffb265073"
    pkg "dotnet-sdk-5.0.100-preview.8.20417.9-osx-x64.pkg"

    name ".NET SDK 5.0.100-preview.8.20417.9,5.0.0-preview.8"
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
