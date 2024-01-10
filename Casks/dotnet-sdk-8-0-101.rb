cask "dotnet-sdk-8-0-101" do
    version "8.0.101,8.0.1"
    
    if Hardware::CPU.intel?
        url "https://download.visualstudio.microsoft.com/download/pr/3b11b408-68e1-4a8f-a0ad-55b21456c4f6/03819d38c79a9aa4fd806f8c7b64130d/dotnet-sdk-#{version.before_comma}-osx-x64.pkg"
        sha256 "1e0ba3f5e0695fd838e0a100d6293b8495185b1e2c788abe94b97d50efb24778"
        pkg "dotnet-sdk-8.0.101-osx-x64.pkg"
    else
        url "https://download.visualstudio.microsoft.com/download/pr/4d6fe60e-611f-4db0-8b03-fc15ee03ca7a/e24b834bd82a75fb2a50a59b8a27aed3/dotnet-sdk-#{version.before_comma}-osx-arm64.pkg"
        sha256 "8c14485026f6fd4380da69c271a090ee7318c733d657011087df79ec567d4173"
        pkg "dotnet-sdk-8.0.101-osx-arm64.pkg"
    end

    name ".NET SDK 8.0.101,8.0.1"
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
