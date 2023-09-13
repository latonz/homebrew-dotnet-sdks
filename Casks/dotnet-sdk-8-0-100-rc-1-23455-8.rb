cask "dotnet-sdk-8-0-100-rc-1-23455-8" do
    version "8.0.100-rc.1.23455.8,8.0.0-rc.1"
    
    if Hardware::CPU.intel?
        url "https://download.visualstudio.microsoft.com/download/pr/b3ff305d-4ba2-4af6-b738-a649150b34b8/269c95893779d176550832a43cb180d8/dotnet-sdk-#{version.before_comma}-osx-x64.pkg"
        sha256 "4373a54b1ac61bf08dddfd276a9dd45a3874856c486c7eb2d8d13a74dd8e51c7"
        pkg "dotnet-sdk-8.0.100-rc.1.23455.8-osx-x64.pkg"
    else
        url "https://download.visualstudio.microsoft.com/download/pr/ba6a5740-80e6-4e04-b0a9-efd8c9be47a4/5717bbfe8433f568eb2d00cccfd9ce8d/dotnet-sdk-#{version.before_comma}-osx-arm64.pkg"
        sha256 "12c738f5eb4979625a582f10fbdb6f86c779ecef77d4d319734bf2730e18dc79"
        pkg "dotnet-sdk-8.0.100-rc.1.23455.8-osx-arm64.pkg"
    end

    name ".NET SDK 8.0.100-rc.1.23455.8,8.0.0-rc.1"
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
