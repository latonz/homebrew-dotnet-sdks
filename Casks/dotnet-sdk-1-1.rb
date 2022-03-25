cask "dotnet-sdk-1-1" do
    version "1.1.14,1.1.13"
    
    url "https://download.visualstudio.microsoft.com/download/pr/1b45ebe7-5d64-4a65-9ba8-8485e41e8e24/bda91af921a3bed26dfae873b0ad942b/dotnet-dev-osx-x64.#{version.before_comma}.pkg"
    sha256 "6994c3642ace33395834d4091352b0b4a22cf09963ca7a1ff30a3cbe120fb6f9"
    pkg "dotnet-dev-osx-x64.1.1.14.pkg"

    name ".NET Core SDK 1.1.14,1.1.13"
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
