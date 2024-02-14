cask "dotnet-sdk-6-0-419" do
    version "6.0.419,6.0.27"
    
    if Hardware::CPU.intel?
        url "https://download.visualstudio.microsoft.com/download/pr/bede9a7c-0980-45a2-b9fd-3477827dfb1e/9c132e3a5ea9d26840f015a957ee1248/dotnet-sdk-#{version.before_comma}-osx-x64.pkg"
        sha256 "a6c44fca17a990b00a9701340cb051915aa73bd82f95f5d23ae4c9c6e0e6ec53"
        pkg "dotnet-sdk-6.0.419-osx-x64.pkg"
    else
        url "https://download.visualstudio.microsoft.com/download/pr/9be72207-eade-45b0-92a9-d48725770f61/8890ebc6575287d598c7139f90cdc2ca/dotnet-sdk-#{version.before_comma}-osx-arm64.pkg"
        sha256 "8c76457c304c3226c5cf17698c164d79b2d66dd9f52aa71ae86dcfad03edfd61"
        pkg "dotnet-sdk-6.0.419-osx-arm64.pkg"
    end

    name ".NET SDK 6.0.419,6.0.27"
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
