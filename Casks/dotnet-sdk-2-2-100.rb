cask "dotnet-sdk-2-2-100" do
    version "2.2.100,2.2.0"
    
    url "https://download.visualstudio.microsoft.com/download/pr/29457b8f-6262-4c4b-8a54-eef308346842/3c7ec575796a2ef0e826a07ca4d13084/dotnet-sdk-#{version.before_comma}-osx-x64.pkg"
    sha256 "3b40cb7c96d982319b8fd0b5d45f97ddbe857e547582ef8a1f1ab636ca2eb030"
    pkg "dotnet-sdk-2.2.100-osx-x64.pkg"

    name ".NET Core SDK 2.2.100,2.2.0"
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
