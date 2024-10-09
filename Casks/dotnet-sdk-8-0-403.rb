cask "dotnet-sdk-8-0-403" do
    version "8.0.403,8.0.10"
    
    if Hardware::CPU.intel?
        url "https://download.visualstudio.microsoft.com/download/pr/d6b3fe61-3c0e-45da-9e37-cef64d4fd3eb/28d536e0ecfbb330ab49454a5e3962f6/dotnet-sdk-#{version.before_comma}-osx-x64.pkg"
        sha256 "cda9f5737413adc752838efb55bc52d631da395d400884506182b8893d6a9949"
        pkg "dotnet-sdk-8.0.403-osx-x64.pkg"
    else
        url "https://download.visualstudio.microsoft.com/download/pr/35b0fb29-cadc-4083-aa26-6cecd2e7ffa1/1a9972a435b73ffdd0b462f979ea5b23/dotnet-sdk-#{version.before_comma}-osx-arm64.pkg"
        sha256 "29844599f2e41002af2605a9811344399b6b50369cf993d91569a1a7909f1293"
        pkg "dotnet-sdk-8.0.403-osx-arm64.pkg"
    end

    name ".NET SDK 8.0.403,8.0.10"
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