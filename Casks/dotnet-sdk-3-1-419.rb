cask "dotnet-sdk-3-1-419" do
    version "3.1.419,3.1.25"
    
    url "https://download.visualstudio.microsoft.com/download/pr/2e8eaaf3-99c7-4c85-8453-a47907642495/a5e53dc81c5ffbd5341f84688e77b87b/dotnet-sdk-#{version.before_comma}-osx-x64.pkg"
    sha256 "cd1b8b727df52c275a659d9ffe73a3710c7314f98b0510b4eb12cf48c32c58c0"
    pkg "dotnet-sdk-3.1.419-osx-x64.pkg"

    name ".NET Core SDK 3.1.419,3.1.25"
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
