cask "dotnet-sdk-7-0-203" do
    version "7.0.203,7.0.5"
    
    if Hardware::CPU.intel?
        url "https://download.visualstudio.microsoft.com/download/pr/08b3b509-05e6-4df1-84e1-a76c8855d899/d9b9a2d8ef9788f345d97304ceb67b07/dotnet-sdk-#{version.before_comma}-osx-x64.pkg"
        sha256 "82e6bfd3301d1b718e136fdaa1dd23d6abb03adbca05fcbc268b0da7e0d65b46"
        pkg "dotnet-sdk-7.0.203-osx-x64.pkg"
    else
        url "https://download.visualstudio.microsoft.com/download/pr/a5070179-d53b-4a84-98d6-37a9d3ef458b/f8bba83817d23e3b7726746c59de4e0c/dotnet-sdk-#{version.before_comma}-osx-arm64.pkg"
        sha256 "c80e0eabfa3681fa1db33c149ccbbb7de9155702aa5baaa11ea63f998151f326"
        pkg "dotnet-sdk-7.0.203-osx-arm64.pkg"
    end

    name ".NET SDK 7.0.203,7.0.5"
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
