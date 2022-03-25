cask "dotnet-sdk-3-1-411" do
    version "3.1.411,3.1.17"
    
    url "https://download.visualstudio.microsoft.com/download/pr/5579eb11-0f40-46ad-9d87-274584ca8231/04c7e06cce0102990290e23fb6f1f139/dotnet-sdk-#{version.before_comma}-osx-x64.pkg"
    sha256 "4c266fbc71414e5a8e0835f6a8817045b38d8d3fdf3ecb183d079f13b5c3525d"
    pkg "dotnet-sdk-3.1.411-osx-x64.pkg"

    name ".NET Core SDK 3.1.411,3.1.17"
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
