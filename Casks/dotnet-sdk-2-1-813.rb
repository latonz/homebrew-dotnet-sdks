cask "dotnet-sdk-2-1-813" do
    version "2.1.813,2.1.25"
    
    url "https://download.visualstudio.microsoft.com/download/pr/1c7f880e-9cfb-46f9-9e6c-1ead2d713d37/54efd298bd08ff1c52d6c9362335da48/dotnet-sdk-#{version.before_comma}-osx-x64.pkg"
    sha256 "906386b661b081b394988458691c90f4dc6e2f0ea6121a8877df66260566e4a2"
    pkg "dotnet-sdk-2.1.813-osx-x64.pkg"

    name ".NET Core SDK 2.1.813,2.1.25"
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
