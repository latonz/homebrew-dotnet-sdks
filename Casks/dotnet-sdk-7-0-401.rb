cask "dotnet-sdk-7-0-401" do
    version "7.0.401,7.0.11"
    
    if Hardware::CPU.intel?
        url "https://download.visualstudio.microsoft.com/download/pr/e0f9aead-ae21-411b-bb38-1c6393fb278a/69566da6d19724215edda3af6a9663cd/dotnet-sdk-#{version.before_comma}-osx-x64.pkg"
        sha256 "c87f8a41b8e35843152ce1325898900a7aae14efde1aa47da3cac237f8772551"
        pkg "dotnet-sdk-7.0.401-osx-x64.pkg"
    else
        url "https://download.visualstudio.microsoft.com/download/pr/ca10bac6-3833-476b-8e5c-4a325fd185bd/6f2b2e056c2a4d322cf55d6ea446bc1c/dotnet-sdk-#{version.before_comma}-osx-arm64.pkg"
        sha256 "2b61df71106869038a3a41b5a0882e12fa53a0d3fff13a4a0aa03700d20e96ce"
        pkg "dotnet-sdk-7.0.401-osx-arm64.pkg"
    end

    name ".NET SDK 7.0.401,7.0.11"
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
