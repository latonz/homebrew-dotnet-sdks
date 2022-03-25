cask "dotnet-sdk-3-1" do
    version "3.1.417,3.1.23"
    
    url "https://download.visualstudio.microsoft.com/download/pr/95c7c3fe-7036-4724-8730-4631603d3b6b/8bc1f5d475ec827f5d8defe984a21a83/dotnet-sdk-#{version.before_comma}-osx-x64.pkg"
    sha256 "2763c8d2a6da693b9ef55ed4c837c5e642b669d19ecfa3eea04e6c1e2386ee83"
    pkg "dotnet-sdk-3.1.417-osx-x64.pkg"

    name ".NET Core SDK 3.1.417,3.1.23"
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
