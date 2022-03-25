cask "dotnet-sdk-5-0-402" do
    version "5.0.402,5.0.11"
    
    url "https://download.visualstudio.microsoft.com/download/pr/88bc1553-e90f-4a4f-9574-65d9a5065cd2/1d5646e1abb8b4d4a61ba0b0be976047/dotnet-sdk-#{version.before_comma}-osx-x64.pkg"
    sha256 "525d0ff470e3d0e16b06787e72bdaf34df385007ee9125aa6f30eced69ef6a61"
    pkg "dotnet-sdk-5.0.402-osx-x64.pkg"

    name ".NET SDK 5.0.402,5.0.11"
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
