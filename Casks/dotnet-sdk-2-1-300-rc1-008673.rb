cask "dotnet-sdk-2-1-300-rc1-008673" do
    version "2.1.300-rc1-008673,2.1.0-rc1"
    
    url "https://download.microsoft.com/download/B/1/9/B19A2F87-F00F-420C-B4B9-A0BA4403F754/dotnet-sdk-#{version.before_comma}-osx-x64.pkg"
    sha256 "84658a38172a27a5bdab78572f0bbadf39ea101dadb87bcc8b6484e4dc8e1f31"
    pkg "dotnet-sdk-2.1.300-rc1-008673-osx-x64.pkg"

    name ".NET Core SDK 2.1.300-rc1-008673,2.1.0-rc1"
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
