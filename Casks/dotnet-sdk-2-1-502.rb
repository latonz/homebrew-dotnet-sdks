cask "dotnet-sdk-2-1-502" do
    version "2.1.502,2.1.502"
    
    url "https://download.visualstudio.microsoft.com/download/pr/06addaf0-590c-4418-9cf4-83f63376ed16/d6e57f0ef630fb767a8ac8cde58e4a6e/dotnet-sdk-#{version.before_comma}-osx-gs-x64.pkg"
    sha256 "6ac8b9ab8666f8cbd75f002e23a1b0edf82dc5d173aa1e5df5b0036570ad2ad9"
    pkg "dotnet-sdk-2.1.502-osx-gs-x64.pkg"

    name ".NET Core SDK 2.1.502,2.1.502"
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
