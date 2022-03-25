cask "dotnet-sdk-2-1-803" do
    version "2.1.803,2.1.15"
    
    url "https://download.visualstudio.microsoft.com/download/pr/81c0b023-b5d7-4753-a9b6-2c7b374913f7/28b113347413fe5fff3976e7ce601724/dotnet-sdk-#{version.before_comma}-osx-x64.pkg"
    sha256 "912af1ba9ecc14345290c031f7d28a903006a4e7d1aefcd7406e02ec1a4727b9"
    pkg "dotnet-sdk-2.1.803-osx-x64.pkg"

    name ".NET Core SDK 2.1.803,2.1.15"
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
