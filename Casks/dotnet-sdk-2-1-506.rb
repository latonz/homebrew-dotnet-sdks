cask "dotnet-sdk-2-1-506" do
    version "2.1.506,2.1.10"
    
    url "https://download.visualstudio.microsoft.com/download/pr/c06b35b8-babd-484a-a4ad-7656d3123393/74ac7db45fceec7a0d2c646b76d6873f/dotnet-sdk-#{version.before_comma}-osx-gs-x64.pkg"
    sha256 "01ea9b89a3f9231090b62f8c01bbcf2558a2ada62c0fbf3f02e59773bd93ac79"
    pkg "dotnet-sdk-2.1.506-osx-gs-x64.pkg"

    name ".NET Core SDK 2.1.506,2.1.10"
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
