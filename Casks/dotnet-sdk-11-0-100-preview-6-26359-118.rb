cask "dotnet-sdk-11-0-100-preview-6-26359-118" do
    version "11.0.100-preview.6.26359.118,11.0.0-preview.6"
    
    if Hardware::CPU.intel?
        url "https://builds.dotnet.microsoft.com/dotnet/Sdk/#{version.before_comma}/dotnet-sdk-#{version.before_comma}-osx-x64.pkg"
        sha256 "17CF7D22554A04F4FD0D71C0D15188D0EC1A81D145D1BD54B507BC5CAC02B325"
        pkg "dotnet-sdk-11.0.100-preview.6.26359.118-osx-x64.pkg"
    else
        url "https://builds.dotnet.microsoft.com/dotnet/Sdk/#{version.before_comma}/dotnet-sdk-#{version.before_comma}-osx-arm64.pkg"
        sha256 "58AFC7EC2791E6E11F2F527FBEE375FCCFB6778B5862C8AA924022E4E4FC60C7"
        pkg "dotnet-sdk-11.0.100-preview.6.26359.118-osx-arm64.pkg"
    end

    name ".NET SDK 11.0.100-preview.6.26359.118,11.0.0-preview.6"
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