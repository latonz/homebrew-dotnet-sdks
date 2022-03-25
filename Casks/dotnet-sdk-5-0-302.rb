cask "dotnet-sdk-5-0-302" do
    version "5.0.302,5.0.8"
    
    url "https://download.visualstudio.microsoft.com/download/pr/6f2d055d-6092-4236-9824-b8326f971301/663c758102cacc0e3f4288c6462fac3f/dotnet-sdk-#{version.before_comma}-osx-x64.pkg"
    sha256 "b26ba0acf498bb5a346c685d73ca7da904a225316996e4cbb367231c6d67c68b"
    pkg "dotnet-sdk-5.0.302-osx-x64.pkg"

    name ".NET SDK 5.0.302,5.0.8"
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
