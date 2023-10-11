cask "dotnet-sdk-8-0-100-rc-2-23502-2" do
    version "8.0.100-rc.2.23502.2,8.0.0-rc.2"
    
    if Hardware::CPU.intel?
        url "https://download.visualstudio.microsoft.com/download/pr/69d7c726-56c4-4652-94e5-4e10a5ac846f/4ef542bc620666656a74d0f6e2235fb8/dotnet-sdk-#{version.before_comma}-osx-x64.pkg"
        sha256 "9d5005eb918efa39fc77d944533a4e9ad2818bcf76a89300e9fd8d6da4130a21"
        pkg "dotnet-sdk-8.0.100-rc.2.23502.2-osx-x64.pkg"
    else
        url "https://download.visualstudio.microsoft.com/download/pr/0e35f353-a3c0-4fe5-9f8c-9db472d07f50/ae1ad30cfc182e4d7766b2bf4a063097/dotnet-sdk-#{version.before_comma}-osx-arm64.pkg"
        sha256 "7cd67cbca1529d51460c752b3821f61f688c8d3d1ca225bd2bb4341d32c34675"
        pkg "dotnet-sdk-8.0.100-rc.2.23502.2-osx-arm64.pkg"
    end

    name ".NET SDK 8.0.100-rc.2.23502.2,8.0.0-rc.2"
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
