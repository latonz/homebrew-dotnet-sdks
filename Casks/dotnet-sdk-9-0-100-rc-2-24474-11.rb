cask "dotnet-sdk-9-0-100-rc-2-24474-11" do
    version "9.0.100-rc.2.24474.11,9.0.0-rc.2"
    
    if Hardware::CPU.intel?
        url "https://download.visualstudio.microsoft.com/download/pr/71285611-e6d6-4758-8a5b-fec2b48fa25b/4aaf5fe8828150531679788c418a5920/dotnet-sdk-#{version.before_comma}-osx-x64.pkg"
        sha256 "9e4a019acb3bd4b70ff8ac44d85d9f1d978657df750d4a9710d417d7f2981619"
        pkg "dotnet-sdk-9.0.100-rc.2.24474.11-osx-x64.pkg"
    else
        url "https://download.visualstudio.microsoft.com/download/pr/2d099a55-d6f5-43f8-bf05-fe90f023554d/03b79d057c06c1ae0855c8e8c5696680/dotnet-sdk-#{version.before_comma}-osx-arm64.pkg"
        sha256 "dd730a97f2781dcd1d474501b854838580332c2e52a9cfa90fcd87d3f99c36fd"
        pkg "dotnet-sdk-9.0.100-rc.2.24474.11-osx-arm64.pkg"
    end

    name ".NET SDK 9.0.100-rc.2.24474.11,9.0.0-rc.2"
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