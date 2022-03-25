cask "dotnet-sdk-2-1-801" do
    version "2.1.801,2.1.801"
    
    url "https://download.visualstudio.microsoft.com/download/pr/0d858af7-d07c-43a4-af9f-75a02c814a76/bb09f81900f42f00fe3078780bf17f08/dotnet-sdk-#{version.before_comma}-osx-gs-x64.pkg"
    sha256 "f067666ebe208c32f4da3e5a1952898e016fc2ffeb772130cf101cefcca424f3"
    pkg "dotnet-sdk-2.1.801-osx-gs-x64.pkg"

    name ".NET Core SDK 2.1.801,2.1.801"
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
