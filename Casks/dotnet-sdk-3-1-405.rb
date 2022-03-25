cask "dotnet-sdk-3-1-405" do
    version "3.1.405,3.1.11"
    
    url "https://download.visualstudio.microsoft.com/download/pr/c447be5f-eb7c-49c8-8588-b36172371fed/99b706d3682c44fb0dc86bffdc428782/dotnet-sdk-#{version.before_comma}-osx-x64.pkg"
    sha256 "704f0c2762c58bead9c2b9107b73831d12fdc1d4514cba0b68474f3247316bb6"
    pkg "dotnet-sdk-3.1.405-osx-x64.pkg"

    name ".NET Core SDK 3.1.405,3.1.11"
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
