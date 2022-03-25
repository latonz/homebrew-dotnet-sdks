cask "dotnet-sdk-5-0-202" do
    version "5.0.202,5.0.5"
    
    url "https://download.visualstudio.microsoft.com/download/pr/749775e4-7b6f-4367-bb7a-9cb63a818dae/c2614b34e234fa03dc65320a8a954570/dotnet-sdk-#{version.before_comma}-osx-x64.pkg"
    sha256 "9c1d1fc5e57845006a4102e01ce9c313b9fc540957209820cdcd8d8ae19bed82"
    pkg "dotnet-sdk-5.0.202-osx-x64.pkg"

    name ".NET SDK 5.0.202,5.0.5"
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
