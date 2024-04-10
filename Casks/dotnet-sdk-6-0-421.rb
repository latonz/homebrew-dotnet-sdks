cask "dotnet-sdk-6-0-421" do
    version "6.0.421,6.0.29"
    
    if Hardware::CPU.intel?
        url "https://download.visualstudio.microsoft.com/download/pr/3654f673-8801-454b-8d34-607a33f3ac39/2b642a9d794c3d3c5a4b218d9f5020d7/dotnet-sdk-#{version.before_comma}-osx-x64.pkg"
        sha256 "a75cf0f07457b50ad021629ad7c07b9556b6fdec236d0062c7531aee4cf62a3a"
        pkg "dotnet-sdk-6.0.421-osx-x64.pkg"
    else
        url "https://download.visualstudio.microsoft.com/download/pr/ddaffb02-761d-4e21-a1fb-c96849a76428/9b97f4cc8a77e337486d5ffbef86ea1e/dotnet-sdk-#{version.before_comma}-osx-arm64.pkg"
        sha256 "52ea87e25061bb4eabe370b9ec6e0a4867c099e2521159a369eeb9d7cce708af"
        pkg "dotnet-sdk-6.0.421-osx-arm64.pkg"
    end

    name ".NET SDK 6.0.421,6.0.29"
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

    zap trash: ["~/.dotnet", "~/.nuget", "/etc/paths.d/dotnet", "/etc/paths.d/dotnet-cli-tools"]
end