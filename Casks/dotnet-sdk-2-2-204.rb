cask "dotnet-sdk-2-2-204" do
    version "2.2.204,2.2.204"
    
    url "https://download.visualstudio.microsoft.com/download/pr/25dd7bd5-f6c1-41ea-99db-0e4ae3bd9b43/4b81ab6878ed9e2057868cb8c61041c9/dotnet-sdk-#{version.before_comma}-osx-gs-x64.pkg"
    sha256 "bed6633d1e1811417cea2d701423ff0dec241f441b42395f618ec5bf5476e89a"
    pkg "dotnet-sdk-2.2.204-osx-gs-x64.pkg"

    name ".NET Core SDK 2.2.204,2.2.204"
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
