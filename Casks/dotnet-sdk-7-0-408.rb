cask "dotnet-sdk-7-0-408" do
    version "7.0.408,7.0.18"
    
    if Hardware::CPU.intel?
        url "https://download.visualstudio.microsoft.com/download/pr/a54f7102-d834-48b0-b6f4-32d9d215dd51/57c2418d3d1d7be290e032e535af2d13/dotnet-sdk-#{version.before_comma}-osx-x64.pkg"
        sha256 "ca3e72f9dab83dba6194bff886711483cb3c590cf9c6bbcdf8d0dbb6e1622bfd"
        pkg "dotnet-sdk-7.0.408-osx-x64.pkg"
    else
        url "https://download.visualstudio.microsoft.com/download/pr/5cd047f7-899a-4e00-9c86-d79fe7fe3d6e/82f1cb63ebebe92d084cfc7ab6204b6f/dotnet-sdk-#{version.before_comma}-osx-arm64.pkg"
        sha256 "04dd3dab6265f299059e14aa87d6e26dd3207fb78fae6b8e768fdc789c9e6a80"
        pkg "dotnet-sdk-7.0.408-osx-arm64.pkg"
    end

    name ".NET SDK 7.0.408,7.0.18"
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

    zap trash: ["~/.dotnet", "~/.nuget", "/etc/paths.d/dotnet", "/etc/paths.d/dotnet-cli-tools"]
end