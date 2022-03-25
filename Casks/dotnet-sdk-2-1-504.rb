cask "dotnet-sdk-2-1-504" do
    version "2.1.504,2.1.8"
    
    url "https://download.visualstudio.microsoft.com/download/pr/b3f7e697-363f-429d-a78f-11c244e476a4/fb34fbea7d52d479cd4f7f8d4263545e/dotnet-sdk-#{version.before_comma}-osx-gs-x64.pkg"
    sha256 "9f2914944d96292cff238238f73bc5215a814bcfc6d9ea17c3d1acce46df7cf5"
    pkg "dotnet-sdk-2.1.504-osx-gs-x64.pkg"

    name ".NET Core SDK 2.1.504,2.1.8"
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
