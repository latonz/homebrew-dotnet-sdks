cask "dotnet-sdk-5-0-100-preview-2-20176-6" do
    version "5.0.100-preview.2.20176.6,5.0.0-preview.2"
    
    url "https://download.visualstudio.microsoft.com/download/pr/3ce4af4f-f5d5-406c-a065-2ecc9bcc5fd2/353affd22a0727b476998312738ac35f/dotnet-sdk-#{version.before_comma}-osx-x64.pkg"
    sha256 "9761cbeb839bb81aad7a63f6d4dde73b0416ea9c06a7a4f59698063a7385c55b"
    pkg "dotnet-sdk-5.0.100-preview.2.20176.6-osx-x64.pkg"

    name ".NET SDK 5.0.100-preview.2.20176.6,5.0.0-preview.2"
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
