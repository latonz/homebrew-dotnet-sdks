cask "dotnet-sdk-2-1-102" do
    version "2.1.102,2.1.102"
    
    url "https://download.microsoft.com/download/1/2/E/12E2BC14-7A9F-4497-A351-02B7C2DDD599/dotnet-sdk-#{version.before_comma}-osx-x64.pkg"
    sha256 "73cec981bffae416b8c985031abfbcefc408ad750eda84ddeabfffabcf709d3b"
    pkg "dotnet-sdk-2.1.102-osx-x64.pkg"

    name ".NET Core SDK 2.1.102,2.1.102"
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
