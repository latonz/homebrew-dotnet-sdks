cask "dotnet-sdk-2-2" do
    version "2.2.207,2.2.8"
    
    url "https://download.visualstudio.microsoft.com/download/pr/837aa87a-8160-4297-b6b7-eceb56b3ce48/74c42db19f2784ab172e27598eae7f4f/dotnet-sdk-#{version.before_comma}-osx-gs-x64.pkg"
    sha256 "ca1fe559025ee3c41f1664eba26079a705c42865dbf5c83c0160e682e9ad83cb"
    pkg "dotnet-sdk-2.2.207-osx-gs-x64.pkg"

    name ".NET Core SDK 2.2.207,2.2.8"
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
