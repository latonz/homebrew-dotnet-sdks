cask "dotnet-sdk-6-0-428" do
    version "6.0.428,6.0.36"
    
    if Hardware::CPU.intel?
        url "https://download.visualstudio.microsoft.com/download/pr/303066f8-6fab-444d-95d2-9b37e3dc7460/17e0b71dc4120eee44e86e595d29f73d/dotnet-sdk-#{version.before_comma}-osx-x64.pkg"
        sha256 "17bd1338041f37b242379b78a92ed9a9529c79894f13e47ae1ecf890a339d3b2"
        pkg "dotnet-sdk-6.0.428-osx-x64.pkg"
    else
        url "https://download.visualstudio.microsoft.com/download/pr/a718526a-7a96-438a-a1d2-341a586e6d9d/5a37e4c29489b6359ce1f857094f40d5/dotnet-sdk-#{version.before_comma}-osx-arm64.pkg"
        sha256 "a613c068212533d6b034cd614daf63633abcfe6697bc016d76a4ece1ce577c7f"
        pkg "dotnet-sdk-6.0.428-osx-arm64.pkg"
    end

    name ".NET SDK 6.0.428,6.0.36"
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