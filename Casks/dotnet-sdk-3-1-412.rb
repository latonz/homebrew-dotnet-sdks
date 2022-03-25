cask "dotnet-sdk-3-1-412" do
    version "3.1.412,3.1.18"
    
    url "https://download.visualstudio.microsoft.com/download/pr/46981fb5-7b16-4c5b-bedb-68a479939a41/b0295f7dda05c6ec038fc023168259dd/dotnet-sdk-#{version.before_comma}-osx-x64.pkg"
    sha256 "a45fdeb59ed1b387a2f8d52ac6993b1eb300da726677e7cfef00b90df7ce2038"
    pkg "dotnet-sdk-3.1.412-osx-x64.pkg"

    name ".NET Core SDK 3.1.412,3.1.18"
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
