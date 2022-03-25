cask "dotnet-sdk-2-1-807" do
    version "2.1.807,2.1.19"
    
    url "https://download.visualstudio.microsoft.com/download/pr/32139382-56dc-48a1-87ce-4422ec44c802/33b6bbf2678978d5d697107b6a9fcbfd/dotnet-sdk-#{version.before_comma}-osx-x64.pkg"
    sha256 "84267049a08ac0e87b8748743fef41fdf9b6693430ef1d6a3a403998fa7d3895"
    pkg "dotnet-sdk-2.1.807-osx-x64.pkg"

    name ".NET Core SDK 2.1.807,2.1.19"
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
