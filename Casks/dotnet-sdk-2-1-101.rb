cask "dotnet-sdk-2-1-101" do
    version "2.1.101,2.0.6"
    
    url "https://download.microsoft.com/download/D/C/F/DCFA73BE-93CE-4DA0-AB76-98972FD6E475/dotnet-sdk-#{version.before_comma}-osx-x64.pkg"
    sha256 "a4d68da13a71e504dea4a512a7f9cfe904380727548d169bc080aca2b5cd1482"
    pkg "dotnet-sdk-2.1.101-osx-x64.pkg"

    name ".NET Core SDK 2.1.101,2.0.6"
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
