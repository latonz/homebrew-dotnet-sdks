cask "dotnet-sdk-7-0-406" do
    version "7.0.406,7.0.16"
    
    if Hardware::CPU.intel?
        url "https://download.visualstudio.microsoft.com/download/pr/43e9b2c8-f397-4170-8cc8-9f01de1b3356/62af9e5b39a50ce42d4c9118d26ce9dd/dotnet-sdk-#{version.before_comma}-osx-x64.pkg"
        sha256 "a02bb4dfcb160e81c687573158e2161ff1858728ad3d409d53c4fd3cd3bf3915"
        pkg "dotnet-sdk-7.0.406-osx-x64.pkg"
    else
        url "https://download.visualstudio.microsoft.com/download/pr/d4e19153-d851-434f-9c9a-c59ecbf58ea6/265b5d1f0ea6f1576b3688f063c1610b/dotnet-sdk-#{version.before_comma}-osx-arm64.pkg"
        sha256 "d60a29b84ba0623d9297a571dd19606ccb15a5322dc21e51eec81f2fdcb4529c"
        pkg "dotnet-sdk-7.0.406-osx-arm64.pkg"
    end

    name ".NET SDK 7.0.406,7.0.16"
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
