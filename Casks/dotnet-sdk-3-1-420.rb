cask "dotnet-sdk-3-1-420" do
    version "3.1.420,3.1.26"
    
    url "https://download.visualstudio.microsoft.com/download/pr/ed7270b9-903b-4cc7-8a85-6cea3f954720/29603443e7d51971b04b6ed3a6911eac/dotnet-sdk-#{version.before_comma}-osx-x64.pkg"
    sha256 "00b1acd5527810767c99bf966543a871770dfdfb0af22e6d4c178221717eee27"
    pkg "dotnet-sdk-3.1.420-osx-x64.pkg"

    name ".NET Core SDK 3.1.420,3.1.26"
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
