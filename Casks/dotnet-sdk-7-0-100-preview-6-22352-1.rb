cask "dotnet-sdk-7-0-100-preview-6-22352-1" do
    version "7.0.100-preview.6.22352.1,7.0.0-preview.6"
    
    if Hardware::CPU.intel?
        url "https://download.visualstudio.microsoft.com/download/pr/fc8101ee-2814-44a2-8851-4422ee2c135a/a819b175ab87c85f900648e38c3bb435/dotnet-sdk-#{version.before_comma}-osx-x64.pkg"
        sha256 "792cedba1df76aaafc67ebb2fe988d54c6062dad6802b4c11d2a81a4497b9664"
        pkg "dotnet-sdk-7.0.100-preview.6.22352.1-osx-x64.pkg"
    else
        url "https://download.visualstudio.microsoft.com/download/pr/ccf21c3d-0dfe-4765-a152-ab94c46e10f1/d098dd0759b6c1194913707a4a134107/dotnet-sdk-#{version.before_comma}-osx-arm64.pkg"
        sha256 "379e2d12e1ca7a97f8c70be35eb0b4624d5ab03de4f793a89eb7ddae44f36ab3"
        pkg "dotnet-sdk-7.0.100-preview.6.22352.1-osx-arm64.pkg"
    end

    name ".NET SDK 7.0.100-preview.6.22352.1,7.0.0-preview.6"
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
