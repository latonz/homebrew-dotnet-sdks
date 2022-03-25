cask "dotnet-sdk-6-0-100-preview-4-21255-9" do
    version "6.0.100-preview.4.21255.9,6.0.0-preview.4"
    
    if Hardware::CPU.intel?
        url "https://download.visualstudio.microsoft.com/download/pr/ac07e48a-76f2-43d4-963f-44570a91bad0/db2f18e6725314da693d59bbe997eb40/dotnet-sdk-#{version.before_comma}-osx-x64.pkg"
        sha256 "b54b57a285f108d451d246d3187d53dc33f2abfba69a689d0c8003a6e2e7e739"
        pkg "dotnet-sdk-6.0.100-preview.4.21255.9-osx-x64.pkg"
    else
        url "https://download.visualstudio.microsoft.com/download/pr/bd11a494-6dc8-4b74-8980-f784593a66e9/13703559437ed332269bda08e90a2f40/dotnet-sdk-#{version.before_comma}-osx-arm64.pkg"
        sha256 "1fc23b8f9ab1d49b77540c7a2b111354dcff3f81637c4dc34ee595fa4f618d6d"
        pkg "dotnet-sdk-6.0.100-preview.4.21255.9-osx-arm64.pkg"
    end

    name ".NET SDK 6.0.100-preview.4.21255.9,6.0.0-preview.4"
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
