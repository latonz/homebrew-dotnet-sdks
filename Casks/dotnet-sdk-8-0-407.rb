cask "dotnet-sdk-8-0-407" do
    version "8.0.407,8.0.14"
    
    if Hardware::CPU.intel?
        url "https://download.visualstudio.microsoft.com/download/pr/36cd1a79-ccbe-4e86-b2ea-d4b45aecae1d/baee9ad982dc7c8058ec825978bf2400/dotnet-sdk-#{version.before_comma}-osx-x64.pkg"
        sha256 "b09e6c16650da962e98e761c6134c31a04ea92591a40a58ec6dc211edb464e49"
        pkg "dotnet-sdk-8.0.407-osx-x64.pkg"
    else
        url "https://download.visualstudio.microsoft.com/download/pr/d798274b-2bfe-48d7-8f0f-70b15a0198f0/b2d3de9536ce33aea258211b8ba55c20/dotnet-sdk-#{version.before_comma}-osx-arm64.pkg"
        sha256 "6cad4e5449a37df79cbd278e0ce2c6b380c3449a708c77d811ba9b1a4383ea0b"
        pkg "dotnet-sdk-8.0.407-osx-arm64.pkg"
    end

    name ".NET SDK 8.0.407,8.0.14"
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