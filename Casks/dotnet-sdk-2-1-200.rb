cask "dotnet-sdk-2-1-200" do
    version "2.1.200,2.0.8"
    
    url "https://download.microsoft.com/download/3/7/1/37189942-C91D-46E9-907B-CF2B2DE584C7/dotnet-sdk-#{version.before_comma}-osx-x64.pkg"
    sha256 "88f58c451b3bc4317b96064429434111d78bb7fc453a511418a0c86276c87c28"
    pkg "dotnet-sdk-2.1.200-osx-x64.pkg"

    name ".NET Core SDK 2.1.200,2.0.8"
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
