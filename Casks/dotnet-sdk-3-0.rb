cask "dotnet-sdk-3-0" do
    version "3.0.103,3.0.3"
    
    url "https://download.visualstudio.microsoft.com/download/pr/0940cd74-9702-4c11-8ed1-883a4d8b53f3/f699c036a9e6731b4168f22884da2b37/dotnet-sdk-#{version.before_comma}-osx-x64.pkg"
    sha256 "56ae6b99fea8d2d510c71d6762a1d92004a0225dc0e7efd836067a6a688e9b7f"
    pkg "dotnet-sdk-3.0.103-osx-x64.pkg"

    name ".NET Core SDK 3.0.103,3.0.3"
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
