cask "dotnet-sdk-5-0-100-rc-2-20479-15" do
    version "5.0.100-rc.2.20479.15,5.0.0-rc.2"
    
    url "https://download.visualstudio.microsoft.com/download/pr/414d772d-9d3f-471b-8cc4-3badae3fc6f1/4324fbb212b8801c4b81723535b7e5d5/dotnet-sdk-#{version.before_comma}-osx-x64.pkg"
    sha256 "b151408638ce97b67f7dc041e74c8e8ce454a1abdccce212c2209786790bae25"
    pkg "dotnet-sdk-5.0.100-rc.2.20479.15-osx-x64.pkg"

    name ".NET SDK 5.0.100-rc.2.20479.15,5.0.0-rc.2"
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
