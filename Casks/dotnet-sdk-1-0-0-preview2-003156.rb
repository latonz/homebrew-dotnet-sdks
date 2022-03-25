cask "dotnet-sdk-1-0-0-preview2-003156" do
    version "1.0.0-preview2-003156,1.0.3"
    
    url "https://download.microsoft.com/download/A/F/F/AFF54A80-A370-4595-B22C-2575C10F5F4F/sdk/dotnet-dev-osx-x64.#{version.before_comma}.pkg"
    sha256 "1bcb8672d3c6cdb51f32d17140132d92f57b124de9aebfe5332ad7ed9f885bc4"
    pkg "dotnet-dev-osx-x64.1.0.0-preview2-003156.pkg"

    name ".NET Core SDK 1.0.0-preview2-003156,1.0.3"
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
