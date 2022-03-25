cask "dotnet-sdk-3-1-414" do
    version "3.1.414,3.1.20"
    
    url "https://download.visualstudio.microsoft.com/download/pr/0517421d-3300-42c7-a420-e42d55068126/76b722e65c0745962156e622ed76501c/dotnet-sdk-#{version.before_comma}-osx-x64.pkg"
    sha256 "758d0c3685a02fb923a4d7c0d685c849b163ef8201d4423c91482ede250eaedf"
    pkg "dotnet-sdk-3.1.414-osx-x64.pkg"

    name ".NET Core SDK 3.1.414,3.1.20"
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
