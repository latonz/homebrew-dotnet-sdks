cask "dotnet-sdk-3-0-100-preview5-011568" do
    version "3.0.100-preview5-011568,3.0.0-preview5"
    
    url "https://download.visualstudio.microsoft.com/download/pr/bdfaed78-c075-4df1-90b4-9f0abc2d8e34/8c334c978118e9f9d45884db5b008c7a/dotnet-sdk-#{version.before_comma}-osx-gs-x64.pkg"
    sha256 "42b04e419ca1f4b9a95836d3663f94dd4113a755f808a30a93988fe8e6e4a16e"
    pkg "dotnet-sdk-3.0.100-preview5-011568-osx-gs-x64.pkg"

    name ".NET Core SDK 3.0.100-preview5-011568,3.0.0-preview5"
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
