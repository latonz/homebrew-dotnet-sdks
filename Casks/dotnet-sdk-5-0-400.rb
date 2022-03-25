cask "dotnet-sdk-5-0-400" do
    version "5.0.400,5.0.9"
    
    url "https://download.visualstudio.microsoft.com/download/pr/543144ce-10ad-4396-a464-28c440f8fe22/29bd5273237ed3a408aef1f8aacd239b/dotnet-sdk-#{version.before_comma}-osx-x64.pkg"
    sha256 "b3b7300e283eeefaa4b7c8b166e6b7a964a66a83ff2797da912bcfc6e03b93cf"
    pkg "dotnet-sdk-5.0.400-osx-x64.pkg"

    name ".NET SDK 5.0.400,5.0.9"
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
