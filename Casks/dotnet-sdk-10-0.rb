cask "dotnet-sdk-10-0" do
    version "10.0.100-preview.3.25201.16,10.0.0-preview.3"
    
    if Hardware::CPU.intel?
        url "https://builds.dotnet.microsoft.com/dotnet/Sdk/#{version.before_comma}/dotnet-sdk-#{version.before_comma}-osx-x64.pkg"
        sha256 "8dd5bf7df1499fffdcd4c3d4e67adda2dfb2a706c1eb6649a6d9ca64c2ef7d10"
        pkg "dotnet-sdk-10.0.100-preview.3.25201.16-osx-x64.pkg"
    else
        url "https://builds.dotnet.microsoft.com/dotnet/Sdk/#{version.before_comma}/dotnet-sdk-#{version.before_comma}-osx-arm64.pkg"
        sha256 "8acb18e62c0a4ac86f8e9ae19c57d5921d8c49fcce75478e38e78e4a0e4d6954"
        pkg "dotnet-sdk-10.0.100-preview.3.25201.16-osx-arm64.pkg"
    end

    name ".NET SDK 10.0.100-preview.3.25201.16,10.0.0-preview.3"
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