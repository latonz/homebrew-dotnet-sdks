cask "dotnet-sdk-7-0-200" do
    version "7.0.200,7.0.3"
    
    if Hardware::CPU.intel?
        url "https://download.visualstudio.microsoft.com/download/pr/f8383fbb-f5d9-4a0b-95fb-2c65a0e5c050/38bf5bf31fdcede0eab86ba84b54ed81/dotnet-sdk-#{version.before_comma}-osx-x64.pkg"
        sha256 "9802784506f3a8493ae01c5c2881c69ca6575b5f3621220ff8632e16cba500e9"
        pkg "dotnet-sdk-7.0.200-osx-x64.pkg"
    else
        url "https://download.visualstudio.microsoft.com/download/pr/a4baeeb9-efb8-446a-a0db-4f907121b9c7/ad72727dada1c2788fbfd1df08b5b5a7/dotnet-sdk-#{version.before_comma}-osx-arm64.pkg"
        sha256 "45034c706516120eff5fd37d0cbbb58361cb9a50f07e4a0ba88b656a8bb8cb21"
        pkg "dotnet-sdk-7.0.200-osx-arm64.pkg"
    end

    name ".NET SDK 7.0.200,7.0.3"
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
