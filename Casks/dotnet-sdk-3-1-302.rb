cask "dotnet-sdk-3-1-302" do
    version "3.1.302,3.1.6"
    
    url "https://download.visualstudio.microsoft.com/download/pr/fff497aa-e6f6-4556-b67b-d139e772156f/4efa99b6bf0cb59104920dfd5f65f8a8/dotnet-sdk-#{version.before_comma}-osx-x64.pkg"
    sha256 "c94d7ff32ada2a5df97fd34820b022986edc3d0d9db4a6d4a63f26be7adf4090"
    pkg "dotnet-sdk-3.1.302-osx-x64.pkg"

    name ".NET Core SDK 3.1.302,3.1.6"
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
