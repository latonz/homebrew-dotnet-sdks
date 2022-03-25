cask "dotnet-sdk-5-0-100-preview-7-20366-6" do
    version "5.0.100-preview.7.20366.6,5.0.0-preview.7"
    
    url "https://download.visualstudio.microsoft.com/download/pr/7a2f569c-f3be-43f7-8f5d-ccc2b62b06ca/a7f72e40a5ee418cd15fa477d30d4b30/dotnet-sdk-#{version.before_comma}-osx-x64.pkg"
    sha256 "725043ea36cf23e038129f2a8d845a9c91a2a6023c7583ace994bd1561587d6e"
    pkg "dotnet-sdk-5.0.100-preview.7.20366.6-osx-x64.pkg"

    name ".NET SDK 5.0.100-preview.7.20366.6,5.0.0-preview.7"
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
