cask "dotnet-sdk-7-0-402" do
    version "7.0.402,7.0.12"
    
    if Hardware::CPU.intel?
        url "https://download.visualstudio.microsoft.com/download/pr/0998f773-80a6-4a6e-bf1f-4a83dd5df01f/ce12481071bbf6350a92e231c7217db6/dotnet-sdk-#{version.before_comma}-osx-x64.pkg"
        sha256 "b4d7b0b182e3bb7e3c9a5ab45ea6796035e0ee4534d033d9dadbf3c056dad3a2"
        pkg "dotnet-sdk-7.0.402-osx-x64.pkg"
    else
        url "https://download.visualstudio.microsoft.com/download/pr/2054d7e3-f46c-4b44-9cb1-6b7f8418bc3d/bcb923c0a5d978f7590a176191931455/dotnet-sdk-#{version.before_comma}-osx-arm64.pkg"
        sha256 "183b3a17754adc7e2906766ad4f62359e33a84f4e65fdbc85525dafd63578253"
        pkg "dotnet-sdk-7.0.402-osx-arm64.pkg"
    end

    name ".NET SDK 7.0.402,7.0.12"
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

    zap trash: ["~/.dotnet", "~/.nuget", "/etc/paths.d/dotnet", "/etc/paths.d/dotnet-cli-tools"]
end
