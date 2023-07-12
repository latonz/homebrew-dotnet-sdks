cask "dotnet-sdk-7-0-306" do
    version "7.0.306,7.0.9"
    
    if Hardware::CPU.intel?
        url "https://download.visualstudio.microsoft.com/download/pr/534a66a3-31a4-4cf7-9866-319414f5876d/f6e644cc2bdcab7801efef1c533e8400/dotnet-sdk-#{version.before_comma}-osx-x64.pkg"
        sha256 "129c927b3e0446bec06583f659d2f6681e6551b2ef7c7f258bc0b3ca97b7c214"
        pkg "dotnet-sdk-7.0.306-osx-x64.pkg"
    else
        url "https://download.visualstudio.microsoft.com/download/pr/4cfe3db4-4922-404d-b2de-db478a9a6c4a/5ec100c639e38cac64a61a02c9ab4df7/dotnet-sdk-#{version.before_comma}-osx-arm64.pkg"
        sha256 "50a412b0e7e4da20d846de5afe17ea0874697db044b049ab2021eef8824e6b34"
        pkg "dotnet-sdk-7.0.306-osx-arm64.pkg"
    end

    name ".NET SDK 7.0.306,7.0.9"
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
