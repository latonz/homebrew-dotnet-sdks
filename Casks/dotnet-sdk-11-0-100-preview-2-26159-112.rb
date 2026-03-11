cask "dotnet-sdk-11-0-100-preview-2-26159-112" do
    version "11.0.100-preview.2.26159.112,11.0.0-preview.2"
    
    if Hardware::CPU.intel?
        url "https://builds.dotnet.microsoft.com/dotnet/Sdk/#{version.before_comma}/dotnet-sdk-#{version.before_comma}-osx-x64.pkg"
        sha256 "7A03A5D3C210B9F567433B350834965AC8E81365F3069E7A8D888FE189E77E3C"
        pkg "dotnet-sdk-11.0.100-preview.2.26159.112-osx-x64.pkg"
    else
        url "https://builds.dotnet.microsoft.com/dotnet/Sdk/#{version.before_comma}/dotnet-sdk-#{version.before_comma}-osx-arm64.pkg"
        sha256 "14843284BBEE7A5A2B1FA814E2D6809404E5746789FAC6151A2A8FD07BED786D"
        pkg "dotnet-sdk-11.0.100-preview.2.26159.112-osx-arm64.pkg"
    end

    name ".NET SDK 11.0.100-preview.2.26159.112,11.0.0-preview.2"
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