cask "dotnet-sdk-2-2-100-preview2-009404" do
    version "2.2.100-preview2-009404,2.2.0-preview2"
    
    url "https://download.microsoft.com/download/D/5/9/D593CD8F-04E7-425D-962C-86FF4C90B1DA/dotnet-sdk-#{version.before_comma}-osx-gs-x64.pkg"
    sha256 "0df3645b21197a50bfeaeb34887230cd194c8a160834115f761cbfa3e7019015"
    pkg "dotnet-sdk-2.2.100-preview2-009404-osx-gs-x64.pkg"

    name ".NET Core SDK 2.2.100-preview2-009404,2.2.0-preview2"
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
