cask "dotnet-sdk-6-0-202" do
    version "6.0.202,6.0.4"
    
    if Hardware::CPU.intel?
        url "https://download.visualstudio.microsoft.com/download/pr/4332c16b-5a65-4adf-b25d-f6a46ef2b335/1a1edc2dab547161e2448390c3d4f56d/dotnet-sdk-#{version.before_comma}-osx-x64.pkg"
        sha256 "e3378b6c90c6ae98b026db14ae7a7703dc01eae79c00d5e455cd73365a54c3f9"
        pkg "dotnet-sdk-6.0.202-osx-x64.pkg"
    else
        url "https://download.visualstudio.microsoft.com/download/pr/605dfd20-32ac-470a-b366-cbb293ce4cfe/9c1eec28d0e6068721026a5f77af2e60/dotnet-sdk-#{version.before_comma}-osx-arm64.pkg"
        sha256 "7d5c2f37cfc2fee080deac1d972f8413c84d97532157a346bac72f607b91a7c5"
        pkg "dotnet-sdk-6.0.202-osx-arm64.pkg"
    end

    name ".NET SDK 6.0.202,6.0.4"
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
