cask "dotnet-sdk-10-0" do
    version "10.0.100-preview.1.25120.13,10.0.0-preview.1"
    
    if Hardware::CPU.intel?
        url "https://download.visualstudio.microsoft.com/download/pr/80339095-1418-4792-9d81-d7b8dc44a436/d8f1d068666055023d1c98e6d4f8fd60/dotnet-sdk-#{version.before_comma}-osx-x64.pkg"
        sha256 "fb9891063e3f27df0ee9748e7a1b0fb66bb8f89b510451fd8f2537ff915792bc"
        pkg "dotnet-sdk-10.0.100-preview.1.25120.13-osx-x64.pkg"
    else
        url "https://download.visualstudio.microsoft.com/download/pr/a826c444-678e-487e-8c4e-ebfc14afca99/d22a35c78682369beb65d20afc995a7e/dotnet-sdk-#{version.before_comma}-osx-arm64.pkg"
        sha256 "d243a9fee935da7a37819c338b41ef28186c43594d76a89d52be757dda073b04"
        pkg "dotnet-sdk-10.0.100-preview.1.25120.13-osx-arm64.pkg"
    end

    name ".NET SDK 10.0.100-preview.1.25120.13,10.0.0-preview.1"
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