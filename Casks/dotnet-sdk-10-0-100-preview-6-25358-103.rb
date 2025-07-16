cask "dotnet-sdk-10-0-100-preview-6-25358-103" do
    version "10.0.100-preview.6.25358.103,10.0.0-preview.6"
    
    if Hardware::CPU.intel?
        url "https://builds.dotnet.microsoft.com/dotnet/Sdk/#{version.before_comma}/dotnet-sdk-#{version.before_comma}-osx-x64.pkg"
        sha256 "C8128D2B6FEC3F1EAF262D55682301A5C5325BCE2812797D3F9C20AADCB96432"
        pkg "dotnet-sdk-10.0.100-preview.6.25358.103-osx-x64.pkg"
    else
        url "https://builds.dotnet.microsoft.com/dotnet/Sdk/#{version.before_comma}/dotnet-sdk-#{version.before_comma}-osx-arm64.pkg"
        sha256 "0AAB5881230C8D2A1F42C77C7D86950576794E1B9AAD7428A11DD6A60941A925"
        pkg "dotnet-sdk-10.0.100-preview.6.25358.103-osx-arm64.pkg"
    end

    name ".NET SDK 10.0.100-preview.6.25358.103,10.0.0-preview.6"
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