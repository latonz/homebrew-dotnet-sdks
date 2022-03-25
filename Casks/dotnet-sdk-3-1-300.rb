cask "dotnet-sdk-3-1-300" do
    version "3.1.300,3.1.4"
    
    url "https://download.visualstudio.microsoft.com/download/pr/f34b8ee5-1123-4a84-86a1-73fb8fb4eae8/812ae0ed01a226ebc000d2df27f5a049/dotnet-sdk-#{version.before_comma}-osx-x64.pkg"
    sha256 "6fabee84cbce7bc46233b9dba53ef528ea3a866ceda7850089ed13ec895aa1b4"
    pkg "dotnet-sdk-3.1.300-osx-x64.pkg"

    name ".NET Core SDK 3.1.300,3.1.4"
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
