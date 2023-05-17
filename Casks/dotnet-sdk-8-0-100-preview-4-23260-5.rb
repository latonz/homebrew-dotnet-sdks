cask "dotnet-sdk-8-0-100-preview-4-23260-5" do
    version "8.0.100-preview.4.23260.5,8.0.0-preview.4"
    
    if Hardware::CPU.intel?
        url "https://download.visualstudio.microsoft.com/download/pr/c06279c7-f65e-4da0-bca8-5ae18a652e75/f645c5e53f6d3d51120b1e62cec2cc78/dotnet-sdk-#{version.before_comma}-osx-x64.pkg"
        sha256 "a265f753fa1656144a2f05a7946611f726202d6d1e436825001a76cf8e2858e4"
        pkg "dotnet-sdk-8.0.100-preview.4.23260.5-osx-x64.pkg"
    else
        url "https://download.visualstudio.microsoft.com/download/pr/593bd437-c6f3-412c-9cb0-206addab56d3/330ac8f331f7c9b9e8860669c767cb43/dotnet-sdk-#{version.before_comma}-osx-arm64.pkg"
        sha256 "1422e73da826f1d06ca5125f3c9d697dbf4ab5dd74e14083ce2f528be1cd5898"
        pkg "dotnet-sdk-8.0.100-preview.4.23260.5-osx-arm64.pkg"
    end

    name ".NET SDK 8.0.100-preview.4.23260.5,8.0.0-preview.4"
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
