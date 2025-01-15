cask "dotnet-sdk-8-0-405" do
    version "8.0.405,8.0.12"
    
    if Hardware::CPU.intel?
        url "https://download.visualstudio.microsoft.com/download/pr/a88b8e95-7d3e-4f53-b88e-1a024dfba2b3/64d05ed6f09b98c8bebbced131cc456b/dotnet-sdk-#{version.before_comma}-osx-x64.pkg"
        sha256 "7c9cd6c91c4bcfe924753269b63daa47b44d69ebf61251ac7f07dfd7d410b52b"
        pkg "dotnet-sdk-8.0.405-osx-x64.pkg"
    else
        url "https://download.visualstudio.microsoft.com/download/pr/b4f4563c-d597-4ae0-b600-325906a8cfed/b31b22966e3d486aefb9f87bf8da643e/dotnet-sdk-#{version.before_comma}-osx-arm64.pkg"
        sha256 "90f19f7865509555a195f483dfb7b894670a841cec47bcea35d94ba39428e813"
        pkg "dotnet-sdk-8.0.405-osx-arm64.pkg"
    end

    name ".NET SDK 8.0.405,8.0.12"
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