cask "dotnet-sdk-5-0-200" do
    version "5.0.200,5.0.3"
    
    url "https://download.visualstudio.microsoft.com/download/pr/a06c387d-2811-4fba-8b5f-86cb9f0bdeba/f41d1c63c5b6bcee9293484e845bc518/dotnet-sdk-#{version.before_comma}-osx-x64.pkg"
    sha256 "a61380051e7e076e6a2d1e3353647bd31c2e1417f4e3d9947b06e0a8ac4b0310"
    pkg "dotnet-sdk-5.0.200-osx-x64.pkg"

    name ".NET SDK 5.0.200,5.0.3"
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
