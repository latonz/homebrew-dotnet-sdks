cask "dotnet-sdk-2-1-816" do
    version "2.1.816,2.1.28"
    
    url "https://download.visualstudio.microsoft.com/download/pr/277c5dde-2b75-4157-9f84-f596b59d8972/550b12c5fb217701b6e87be925b771fa/dotnet-sdk-#{version.before_comma}-osx-x64.pkg"
    sha256 "b86deeff4cfd024190e136f38aa41fc5885f217236516cfb77a500547635570b"
    pkg "dotnet-sdk-2.1.816-osx-x64.pkg"

    name ".NET Core SDK 2.1.816,2.1.28"
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
