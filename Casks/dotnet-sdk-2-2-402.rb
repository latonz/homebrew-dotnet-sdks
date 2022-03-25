cask "dotnet-sdk-2-2-402" do
    version "2.2.402,2.2.7"
    
    url "https://download.visualstudio.microsoft.com/download/pr/7430e32b-092b-4448-add7-2dcf40a7016d/1076952734fbf775062b48344d1a1587/dotnet-sdk-#{version.before_comma}-osx-x64.pkg"
    sha256 "e74d816bc034d0fcdfa847286a6cad097227d4864da1c97fe801012af0c26341"
    pkg "dotnet-sdk-2.2.402-osx-x64.pkg"

    name ".NET Core SDK 2.2.402,2.2.7"
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
