cask "dotnet-sdk-8-0-401" do
    version "8.0.401,8.0.8"
    
    if Hardware::CPU.intel?
        url "https://download.visualstudio.microsoft.com/download/pr/62d5b0f6-e67e-4d89-9758-e285c407eb6c/38cd1ca749bffd444fe4fc1cedf3b692/dotnet-sdk-#{version.before_comma}-osx-x64.pkg"
        sha256 "c431162f1b26e93b0d696012cf3a594cca9a0eee398e22298931602cce84476a"
        pkg "dotnet-sdk-8.0.401-osx-x64.pkg"
    else
        url "https://download.visualstudio.microsoft.com/download/pr/1764cd94-29ac-46b2-b308-77d02b47486d/8397cdc3d842a60f062f1a08199a4974/dotnet-sdk-#{version.before_comma}-osx-arm64.pkg"
        sha256 "e0fbe2f349d9424eeaa7c7edf6b2352cda32f2ecf80e23a8f3da51fa9dfefa2c"
        pkg "dotnet-sdk-8.0.401-osx-arm64.pkg"
    end

    name ".NET SDK 8.0.401,8.0.8"
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