cask "dotnet-sdk-9-0-100-preview-6-24328-19" do
    version "9.0.100-preview.6.24328.19,9.0.0-preview.6"
    
    if Hardware::CPU.intel?
        url "https://download.visualstudio.microsoft.com/download/pr/c7132bf0-f591-4bbc-877e-bb881008c442/12a5262ac08f9d3d6e0cfabfc8806611/dotnet-sdk-#{version.before_comma}-osx-x64.pkg"
        sha256 "1d03d4881cfbe5fe2c2276c86db4ceba83db3a258841bab0f5c6ec9dae6885e0"
        pkg "dotnet-sdk-9.0.100-preview.6.24328.19-osx-x64.pkg"
    else
        url "https://download.visualstudio.microsoft.com/download/pr/c0231fde-8a62-4e17-b396-25a4f8d6cf1e/753d07aa1f5d1652e6f69dab4fb588c5/dotnet-sdk-#{version.before_comma}-osx-arm64.pkg"
        sha256 "5b6df672e0d78612734f1086ab7707b839dbff24fd00a23aa1cd29884da0987f"
        pkg "dotnet-sdk-9.0.100-preview.6.24328.19-osx-arm64.pkg"
    end

    name ".NET SDK 9.0.100-preview.6.24328.19,9.0.0-preview.6"
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