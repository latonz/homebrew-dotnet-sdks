cask "dotnet-sdk-3-1-201" do
    version "3.1.201,3.1.3"
    
    url "https://download.visualstudio.microsoft.com/download/pr/905598d0-17a3-4b42-bf13-c5a69d7aac87/853aff73920dcb013c09a74f05da7f6a/dotnet-sdk-#{version.before_comma}-osx-x64.pkg"
    sha256 "49f6b8e0489227b117287ac2a6c7d5e95919cfa11ca35c6723518bb84b1f7bc8"
    pkg "dotnet-sdk-3.1.201-osx-x64.pkg"

    name ".NET Core SDK 3.1.201,3.1.3"
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
