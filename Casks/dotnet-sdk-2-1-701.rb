cask "dotnet-sdk-2-1-701" do
    version "2.1.701,2.1.12"
    
    url "https://download.visualstudio.microsoft.com/download/pr/bb6e2274-e9cc-4444-8bb3-bb2189bddbcf/074879e1a9c4d158fd92c6358c77828d/dotnet-sdk-#{version.before_comma}-osx-gs-x64.pkg"
    sha256 "722701201d1d405b0f33bbbf917c88e9181dd4be810411236111438bc760697e"
    pkg "dotnet-sdk-2.1.701-osx-gs-x64.pkg"

    name ".NET Core SDK 2.1.701,2.1.12"
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
