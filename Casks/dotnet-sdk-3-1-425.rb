cask "dotnet-sdk-3-1-425" do
    version "3.1.425,3.1.31"
    
    url "https://download.visualstudio.microsoft.com/download/pr/861832ec-7a22-401f-ab1c-1bed35a50bbc/77067aa8919546dbf9ebef6b34137770/dotnet-sdk-#{version.before_comma}-osx-x64.pkg"
    sha256 "0f1e33650d2016e6f1e70228b7cc7685a68ae19819996837463816ffcdaa8936"
    pkg "dotnet-sdk-3.1.425-osx-x64.pkg"

    name ".NET Core SDK 3.1.425,3.1.31"
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
