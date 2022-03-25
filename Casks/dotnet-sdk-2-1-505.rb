cask "dotnet-sdk-2-1-505" do
    version "2.1.505,2.1.9"
    
    url "https://download.visualstudio.microsoft.com/download/pr/515a16d8-3dd4-4c3e-ae09-3441508c9922/026276b3d10550d099b0ebc2c5cef5b6/dotnet-sdk-#{version.before_comma}-osx-gs-x64.pkg"
    sha256 "d6c13c752abefde0032f8ec3fa554ab49fff5b7bb4500a5d304b26825162aea2"
    pkg "dotnet-sdk-2.1.505-osx-gs-x64.pkg"

    name ".NET Core SDK 2.1.505,2.1.9"
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
