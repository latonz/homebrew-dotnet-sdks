cask "dotnet-sdk-8-0-100-preview-1-23115-2" do
    version "8.0.100-preview.1.23115.2,8.0.0-preview.1"
    
    if Hardware::CPU.intel?
        url "https://download.visualstudio.microsoft.com/download/pr/993e8460-176f-4669-9337-b4725c355146/f903c2ff758fee42121da67772dfd0c5/dotnet-sdk-#{version.before_comma}-osx-x64.pkg"
        sha256 "14c99125c3862ef2fad7de863b1f3a98738ae1220d3e6acaaee579ab8ef514e3"
        pkg "dotnet-sdk-8.0.100-preview.1.23115.2-osx-x64.pkg"
    else
        url "https://download.visualstudio.microsoft.com/download/pr/b54698c3-d371-492f-b9f1-998a60136156/3ff37050db93fd5fd5ab86befe42bb08/dotnet-sdk-#{version.before_comma}-osx-arm64.pkg"
        sha256 "19326fe8bd323239cd149232defaccf0d8cf51f765e9eb0f36c274bacf3b3cbf"
        pkg "dotnet-sdk-8.0.100-preview.1.23115.2-osx-arm64.pkg"
    end

    name ".NET SDK 8.0.100-preview.1.23115.2,8.0.0-preview.1"
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
