cask "dotnet-sdk-2-1-103" do
    version "2.1.103,2.1.103"
    
    url "https://download.microsoft.com/download/E/2/6/E266C257-F7AF-4E79-8EA2-DF26031C84E2/dotnet-sdk-#{version.before_comma}-osx-x64.pkg"
    sha256 "6781eb5a7e45b1ad7fc6f2836db0b0fb7eeaf758d0cdc8af54db19eb25e2443f"
    pkg "dotnet-sdk-2.1.103-osx-x64.pkg"

    name ".NET Core SDK 2.1.103,2.1.103"
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
