cask "dotnet-sdk-2-0-3" do
    version "2.0.3,2.0.3"
    
    url "https://download.microsoft.com/download/D/7/2/D725E47F-A4F1-4285-8935-A91AE2FCC06A/dotnet-sdk-#{version.before_comma}-osx-x64.pkg"
    sha256 "74e20721ea22c4dfec3584db536810e7ef8444256c41c95f334bf40132339103"
    pkg "dotnet-sdk-2.0.3-osx-x64.pkg"

    name ".NET Core SDK 2.0.3,2.0.3"
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
