cask "dotnet-sdk-2-2-100-preview1-009349" do
    version "2.2.100-preview1-009349,2.2.0-preview1"
    
    url "https://download.microsoft.com/download/5/9/2/592E5073-8394-4A95-8F48-54080F0F1555/dotnet-sdk-#{version.before_comma}-osx-gs-x64.pkg"
    sha256 "23aeb140ea38114de53da05915080184142dbf66d440cf8b766bd4c5e7ba2238"
    pkg "dotnet-sdk-2.2.100-preview1-009349-osx-gs-x64.pkg"

    name ".NET Core SDK 2.2.100-preview1-009349,2.2.0-preview1"
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
