cask "dotnet-sdk-5-0-300" do
    version "5.0.300,5.0.6"
    
    url "https://download.visualstudio.microsoft.com/download/pr/f79b97b0-b1ec-4251-adf8-1022c527cc13/4372b8911d970486e8f31b0cf2e48d32/dotnet-sdk-#{version.before_comma}-osx-x64.pkg"
    sha256 "a875aacd81c185f378e24b43707b3bfd4bbe3b9ca65b7bd37cd7aefbc8cbbf5b"
    pkg "dotnet-sdk-5.0.300-osx-x64.pkg"

    name ".NET SDK 5.0.300,5.0.6"
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
