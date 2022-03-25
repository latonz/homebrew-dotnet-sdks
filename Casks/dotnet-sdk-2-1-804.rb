cask "dotnet-sdk-2-1-804" do
    version "2.1.804,2.1.16"
    
    url "https://download.visualstudio.microsoft.com/download/pr/f845905d-89d4-4e47-b2ec-398e47ff8411/2f49da28650e5259e694aa7321dcf935/dotnet-sdk-#{version.before_comma}-osx-x64.pkg"
    sha256 "2c07eec50fc0fd35cffe37533f749d2dbe9986327d56b2da32cbbb1621ad1a2e"
    pkg "dotnet-sdk-2.1.804-osx-x64.pkg"

    name ".NET Core SDK 2.1.804,2.1.16"
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
