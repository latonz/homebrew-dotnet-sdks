cask "dotnet-sdk-3-0-100-preview9-014004" do
    version "3.0.100-preview9-014004,3.0.0-preview9"
    
    url "https://download.visualstudio.microsoft.com/download/pr/7a4a68cb-95bc-4e53-8167-1132da004f09/3141f739beac7c1ebb3d4a81a138e93a/dotnet-sdk-#{version.before_comma}-osx-gs-x64.pkg"
    sha256 "2219d6147deaa7df2112d41f03d100b759abab7817d6e4eafc0752d508c47705"
    pkg "dotnet-sdk-3.0.100-preview9-014004-osx-gs-x64.pkg"

    name ".NET Core SDK 3.0.100-preview9-014004,3.0.0-preview9"
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
