cask "dotnet-sdk-1-1-13" do
    version "1.1.13,1.1.12"
    
    url "https://download.visualstudio.microsoft.com/download/pr/294628ef-c677-4f2b-9b32-965d262bd9b0/75b3465b93889ec468521866eb1eb2a2/dotnet-dev-osx-x64.#{version.before_comma}.pkg"
    sha256 "48f007b685491b9f68e654f88e7a428884f7daa08aa5af19cd865482c121f674"
    pkg "dotnet-dev-osx-x64.1.1.13.pkg"

    name ".NET Core SDK 1.1.13,1.1.12"
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
