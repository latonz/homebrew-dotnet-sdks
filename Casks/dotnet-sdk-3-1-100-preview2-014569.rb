cask "dotnet-sdk-3-1-100-preview2-014569" do
    version "3.1.100-preview2-014569,3.1.0-preview2"
    
    url "https://download.visualstudio.microsoft.com/download/pr/f5f89fcd-4146-4774-8004-ac68fa78f2a9/8523da107916288fdbbec6972b161f0f/dotnet-sdk-#{version.before_comma}-osx-gs-x64.pkg"
    sha256 "6e4613dc343fe5cf7ce240a462208aa7fc74bf5b117b73dfa51797e1be7d9c3a"
    pkg "dotnet-sdk-3.1.100-preview2-014569-osx-gs-x64.pkg"

    name ".NET Core SDK 3.1.100-preview2-014569,3.1.0-preview2"
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
