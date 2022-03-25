cask "dotnet-sdk-2-2-107" do
    version "2.2.107,2.2.5"
    
    url "https://download.visualstudio.microsoft.com/download/pr/b4e6bfc6-1843-4154-8b5a-6bd85702df16/270d40a3ede0b72d3f0b801bf103ea96/dotnet-sdk-#{version.before_comma}-osx-gs-x64.pkg"
    sha256 "a163baac1a6e447367b67726669a3cf42b1a65c2f374e92c28c38d6753c210d2"
    pkg "dotnet-sdk-2.2.107-osx-gs-x64.pkg"

    name ".NET Core SDK 2.2.107,2.2.5"
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
