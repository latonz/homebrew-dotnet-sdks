cask "dotnet-sdk-2-1-201" do
    version "2.1.201,2.1.201"
    
    url "https://download.microsoft.com/download/C/7/D/C7DCA2DE-7163-45D1-A05A-5112DAF51445/dotnet-sdk-#{version.before_comma}-osx-x64.pkg"
    sha256 "990e9c42724b319247a089f6742ba6e0006f2232c9e08b566343218052a41341"
    pkg "dotnet-sdk-2.1.201-osx-x64.pkg"

    name ".NET Core SDK 2.1.201,2.1.201"
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
