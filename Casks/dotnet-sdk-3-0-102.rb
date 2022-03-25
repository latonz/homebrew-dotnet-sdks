cask "dotnet-sdk-3-0-102" do
    version "3.0.102,3.0.2"
    
    url "https://download.visualstudio.microsoft.com/download/pr/3234b6b7-a3da-4e02-ad2a-63d75975f1dc/5a0a2d20b24cadf3e68ba179d4598fa6/dotnet-sdk-#{version.before_comma}-osx-x64.pkg"
    sha256 "d925f90066492021b64254962c38d48208a4d85a687aee95b2617f6329ca3ab9"
    pkg "dotnet-sdk-3.0.102-osx-x64.pkg"

    name ".NET Core SDK 3.0.102,3.0.2"
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
