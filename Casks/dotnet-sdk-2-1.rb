cask "dotnet-sdk-2-1" do
    version "2.1.818,2.1.30"
    
    url "https://download.visualstudio.microsoft.com/download/pr/9f2c289a-f8f1-42cc-b319-091cf0394094/e08707b0494afb833f3cad1a2301aaff/dotnet-sdk-#{version.before_comma}-osx-x64.pkg"
    sha256 "a2ec5343cedf0daeb81fb557601f334633535a53cadd4506aae09dd90ad5d0d9"
    pkg "dotnet-sdk-2.1.818-osx-x64.pkg"

    name ".NET Core SDK 2.1.818,2.1.30"
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
