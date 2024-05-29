cask "dotnet-sdk-6-0-423" do
    version "6.0.423,6.0.31"
    
    if Hardware::CPU.intel?
        url "https://download.visualstudio.microsoft.com/download/pr/7985c7ce-12d1-4180-9e95-3cf81790e958/633824a3c4228754b45106040302a5b2/dotnet-sdk-#{version.before_comma}-osx-x64.pkg"
        sha256 "19f0298720aa2504af2375f150015d98ed391548666253fdfafd3a90782aaaef"
        pkg "dotnet-sdk-6.0.423-osx-x64.pkg"
    else
        url "https://download.visualstudio.microsoft.com/download/pr/8a43cb29-3cfd-41e2-8c80-46ec7ae7192d/3e460e7f35b80aefb18b0d1a90849981/dotnet-sdk-#{version.before_comma}-osx-arm64.pkg"
        sha256 "e231893bdb90b948b35710abd1be71bb5b876a639dd79a9c2159ac7a226b1122"
        pkg "dotnet-sdk-6.0.423-osx-arm64.pkg"
    end

    name ".NET SDK 6.0.423,6.0.31"
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