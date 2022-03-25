cask "dotnet-sdk-5-0-100-preview-6-20318-15" do
    version "5.0.100-preview.6.20318.15,5.0.0-preview.6"
    
    url "https://download.visualstudio.microsoft.com/download/pr/f912c99a-c128-4436-8aa5-433cf502d0ab/4ebe252735cb7ae6cc828b2e0bbe107b/dotnet-sdk-#{version.before_comma}-osx-x64.pkg"
    sha256 "1a58514495433162ae757dd2e746f60e04f444ec2a6c791c3da5eaf3147a6c14"
    pkg "dotnet-sdk-5.0.100-preview.6.20318.15-osx-x64.pkg"

    name ".NET SDK 5.0.100-preview.6.20318.15,5.0.0-preview.6"
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
