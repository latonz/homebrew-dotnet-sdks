cask "dotnet-sdk-6-0-424" do
    version "6.0.424,6.0.32"
    
    if Hardware::CPU.intel?
        url "https://download.visualstudio.microsoft.com/download/pr/0161ccc5-bb74-4d5f-b153-fb9ed1f31531/a3e393ab61522f4b8050cfd2692ad1d6/dotnet-sdk-#{version.before_comma}-osx-x64.pkg"
        sha256 "5e37fe1747490b30adc90fd59dce2a00caf635a447a8fb2952a8ba0a3469f903"
        pkg "dotnet-sdk-6.0.424-osx-x64.pkg"
    else
        url "https://download.visualstudio.microsoft.com/download/pr/c88c088d-fdf3-46f2-bacb-64ea20d20d65/b751a812209385384ec32a3d84124200/dotnet-sdk-#{version.before_comma}-osx-arm64.pkg"
        sha256 "e508a0f124b5c4cd7454621a60f35e716723f03686c9b85c4cfc7679ba0b5c16"
        pkg "dotnet-sdk-6.0.424-osx-arm64.pkg"
    end

    name ".NET SDK 6.0.424,6.0.32"
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