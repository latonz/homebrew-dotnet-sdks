cask "dotnet-sdk-6-0-100-preview-1-21103-13" do
    version "6.0.100-preview.1.21103.13,6.0.0-preview.1"
    
    url "https://download.visualstudio.microsoft.com/download/pr/f7224456-9898-45b6-8acc-b110900653cd/817c4e3b1ee787985fdf85032eb2752d/dotnet-sdk-#{version.before_comma}-osx-x64.pkg"
    sha256 "4e07be0bfa88049d6e6ff5c23f34c66b21725083e366b9c4e40417349c318585"
    pkg "dotnet-sdk-6.0.100-preview.1.21103.13-osx-x64.pkg"

    name ".NET SDK 6.0.100-preview.1.21103.13,6.0.0-preview.1"
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
