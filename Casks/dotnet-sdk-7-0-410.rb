cask "dotnet-sdk-7-0-410" do
    version "7.0.410,7.0.20"
    
    if Hardware::CPU.intel?
        url "https://download.visualstudio.microsoft.com/download/pr/5c791273-2fbb-4330-9ce0-14e24cf9b1c3/14f324dd113f30fc19a4af2e9038589d/dotnet-sdk-#{version.before_comma}-osx-x64.pkg"
        sha256 "42eab8294702d3f206031829eebda95315c6f47944f65e6462ed14f5730d6cb5"
        pkg "dotnet-sdk-7.0.410-osx-x64.pkg"
    else
        url "https://download.visualstudio.microsoft.com/download/pr/ff89348c-045e-4fdc-bd6c-31b6d3940420/7f6cb1235b86ee021a6186fbd8542a1e/dotnet-sdk-#{version.before_comma}-osx-arm64.pkg"
        sha256 "c7c16c5e2e5c22c73e62a5d67c9aff15db5e65ad9905ec1deadfb86d3daef0a8"
        pkg "dotnet-sdk-7.0.410-osx-arm64.pkg"
    end

    name ".NET SDK 7.0.410,7.0.20"
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