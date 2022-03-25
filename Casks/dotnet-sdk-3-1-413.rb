cask "dotnet-sdk-3-1-413" do
    version "3.1.413,3.1.19"
    
    url "https://download.visualstudio.microsoft.com/download/pr/c11490f1-c850-44cb-9229-513fc444c47e/9e421a6823f833b04403fde27f77f97d/dotnet-sdk-#{version.before_comma}-osx-x64.pkg"
    sha256 "cb6d9d0e5afe786089a2059c80ff8174fbde0f17cd3abb9481c87e569295455a"
    pkg "dotnet-sdk-3.1.413-osx-x64.pkg"

    name ".NET Core SDK 3.1.413,3.1.19"
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

    zap trash: ["~/.dotnet", "~/.nuget"]
end
