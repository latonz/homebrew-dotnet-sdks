cask "dotnet-sdk-6-0-412" do
    version "6.0.412,6.0.20"
    
    if Hardware::CPU.intel?
        url "https://download.visualstudio.microsoft.com/download/pr/29422c7c-896f-489e-ae47-d8a343b105c2/123a90e25f0260d92ec192877c5bc7cf/dotnet-sdk-#{version.before_comma}-osx-x64.pkg"
        sha256 "fd24a9fbbb9db60c7c67bf8ca76340b719627dc17b4130afead88b8b807166bf"
        pkg "dotnet-sdk-6.0.412-osx-x64.pkg"
    else
        url "https://download.visualstudio.microsoft.com/download/pr/298ca4ac-bcb3-4be3-9cb2-b3e57021ff66/b3fa8311e2c3ef1401885c15a492a8c0/dotnet-sdk-#{version.before_comma}-osx-arm64.pkg"
        sha256 "8f919fda9e50635f56aac3d97f13e0916c6b973689baeac49ce8556050f56d87"
        pkg "dotnet-sdk-6.0.412-osx-arm64.pkg"
    end

    name ".NET SDK 6.0.412,6.0.20"
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
