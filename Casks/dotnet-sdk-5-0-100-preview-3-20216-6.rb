cask "dotnet-sdk-5-0-100-preview-3-20216-6" do
    version "5.0.100-preview.3.20216.6,5.0.0-preview.3"
    
    url "https://download.visualstudio.microsoft.com/download/pr/3fa9a36e-907c-4d7a-a98a-e50ad0aa4990/ff63364b94e98687d5933c1b9a50a5d0/dotnet-sdk-#{version.before_comma}-osx-x64.pkg"
    sha256 "46220c1bf858d3f41caaedb287de946d0ea2667f6e3cf67d1ce6abe307638164"
    pkg "dotnet-sdk-5.0.100-preview.3.20216.6-osx-x64.pkg"

    name ".NET SDK 5.0.100-preview.3.20216.6,5.0.0-preview.3"
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
