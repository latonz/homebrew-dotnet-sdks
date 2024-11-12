cask "dotnet-sdk-9-0-100" do
    version "9.0.100,9.0.0"
    
    if Hardware::CPU.intel?
        url "https://download.visualstudio.microsoft.com/download/pr/ce4a7dd7-1baa-45b1-a447-76cac8d50218/128808a7422ca2e0ae37901d7c78cd53/dotnet-sdk-#{version.before_comma}-osx-x64.pkg"
        sha256 "07d5ded3aa3e73a3b881a231574cc4d24fc507e316232cd0ed82cf6dc2e85625"
        pkg "dotnet-sdk-9.0.100-osx-x64.pkg"
    else
        url "https://download.visualstudio.microsoft.com/download/pr/2787e86a-6efe-4c4d-a3d1-8fd8c302c639/d386f92a6b2b819cb11cc0382dc98bc7/dotnet-sdk-#{version.before_comma}-osx-arm64.pkg"
        sha256 "f0cf7f4369aabcdda674d2e7ffd1154c769057fc9149a380fc48b32184618c21"
        pkg "dotnet-sdk-9.0.100-osx-arm64.pkg"
    end

    name ".NET SDK 9.0.100,9.0.0"
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