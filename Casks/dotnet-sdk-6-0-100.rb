cask "dotnet-sdk-6-0-100" do
    version "6.0.100,6.0.0"
    
    if Hardware::CPU.intel?
        url "https://download.visualstudio.microsoft.com/download/pr/14a45451-4cc9-48e1-af69-0aff75891d09/ff6e83986a2a9a535015fb3104a90a1b/dotnet-sdk-#{version.before_comma}-osx-x64.pkg"
        sha256 "9203560506408d8f88774358b03cdcfcfa0495682fde6034b24f7ccaeddce2ef"
        pkg "dotnet-sdk-6.0.100-osx-x64.pkg"
    else
        url "https://download.visualstudio.microsoft.com/download/pr/ed60d37e-7842-4fc2-8250-2bd66073d79e/725d486e04d27e45d2b41c687dc35f49/dotnet-sdk-#{version.before_comma}-osx-arm64.pkg"
        sha256 "df96e334b5ac10e9e4abccf81376f52da1ed0fb0ad3822709e3c27b8c0bfa01a"
        pkg "dotnet-sdk-6.0.100-osx-arm64.pkg"
    end

    name ".NET SDK 6.0.100,6.0.0"
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
