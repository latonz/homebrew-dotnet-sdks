cask "dotnet-sdk-8-0-404" do
    version "8.0.404,8.0.11"
    
    if Hardware::CPU.intel?
        url "https://download.visualstudio.microsoft.com/download/pr/656d1b6e-cd8e-4767-bc91-e4cb6cd21cef/36f5b3664238acf0a030fc81efd4410c/dotnet-sdk-#{version.before_comma}-osx-x64.pkg"
        sha256 "1e6a8f773488af81d6ec6c74e921da661ee6c8d00f522108208ec543dc76a0b8"
        pkg "dotnet-sdk-8.0.404-osx-x64.pkg"
    else
        url "https://download.visualstudio.microsoft.com/download/pr/403c6045-6500-4b91-8821-ddac6c4bea59/b36da2c62c46672845828b57cb2ad265/dotnet-sdk-#{version.before_comma}-osx-arm64.pkg"
        sha256 "6303f456d12e45faa531687cd1d075f3d6d789ebdf84810645a126d010de6cfb"
        pkg "dotnet-sdk-8.0.404-osx-arm64.pkg"
    end

    name ".NET SDK 8.0.404,8.0.11"
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