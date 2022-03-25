cask "dotnet-sdk-2-1-814" do
    version "2.1.814,2.1.26"
    
    url "https://download.visualstudio.microsoft.com/download/pr/3a036a13-5995-444c-8021-ca3bdd593fcd/a24ab674317f489eb0f5f8c1d48816dd/dotnet-sdk-#{version.before_comma}-osx-x64.pkg"
    sha256 "7ba2c99a99ec89e65e6593c881eb126a15ed385386efc4d651b85e9b8110ec61"
    pkg "dotnet-sdk-2.1.814-osx-x64.pkg"

    name ".NET Core SDK 2.1.814,2.1.26"
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
