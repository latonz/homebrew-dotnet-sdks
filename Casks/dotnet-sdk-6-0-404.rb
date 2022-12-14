cask "dotnet-sdk-6-0-404" do
    version "6.0.404,6.0.12"
    
    if Hardware::CPU.intel?
        url "https://download.visualstudio.microsoft.com/download/pr/a93ff2f8-c9f6-41d9-ac15-1b96e77f111e/5296b688fcb69e34eb2c6d05a915ee71/dotnet-sdk-#{version.before_comma}-osx-x64.pkg"
        sha256 "ad76beaec22daccd535118b152f74c2bbbd7377ea8aab421ab992e89df41d29c"
        pkg "dotnet-sdk-6.0.404-osx-x64.pkg"
    else
        url "https://download.visualstudio.microsoft.com/download/pr/2a309cee-38ac-4fb5-877e-e4d0a9dbff1b/01a4ad5d7a0ff5734e0749b3880485fb/dotnet-sdk-#{version.before_comma}-osx-arm64.pkg"
        sha256 "c603621b0a579299952f6aebacea79904c50b61131126b8107c7662d063a8204"
        pkg "dotnet-sdk-6.0.404-osx-arm64.pkg"
    end

    name ".NET SDK 6.0.404,6.0.12"
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
