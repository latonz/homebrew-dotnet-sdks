cask "dotnet-sdk-3-1-415" do
    version "3.1.415,3.1.21"
    
    url "https://download.visualstudio.microsoft.com/download/pr/e0fe8c99-e33c-4d75-bd4e-2478ed3ee35a/ff06e47afc7c13bdbbaa50a9713ac772/dotnet-sdk-#{version.before_comma}-osx-x64.pkg"
    sha256 "8b6cc223d81eacb42dd65fed8e3aab860f7e68b39c5dd16590f52c76fc743e6e"
    pkg "dotnet-sdk-3.1.415-osx-x64.pkg"

    name ".NET Core SDK 3.1.415,3.1.21"
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
