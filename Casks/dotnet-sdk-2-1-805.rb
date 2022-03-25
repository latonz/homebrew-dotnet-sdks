cask "dotnet-sdk-2-1-805" do
    version "2.1.805,2.1.17"
    
    url "https://download.visualstudio.microsoft.com/download/pr/1f42da0e-a749-4338-ac39-5160a1f31ab0/74f8b6c934b0dc3024f336460c89e8ad/dotnet-sdk-#{version.before_comma}-osx-x64.pkg"
    sha256 "3f9d2960f92665b68b79967b1092f638dcdca05f79a2e3cde659fa0566c931ed"
    pkg "dotnet-sdk-2.1.805-osx-x64.pkg"

    name ".NET Core SDK 2.1.805,2.1.17"
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
