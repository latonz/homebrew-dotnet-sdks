cask "dotnet-sdk-7-0-100-preview-3-22179-4" do
    version "7.0.100-preview.3.22179.4,7.0.0-preview.3"
    
    if Hardware::CPU.intel?
        url "https://download.visualstudio.microsoft.com/download/pr/c0a621a8-72ff-41a5-9b5b-198d78bf0280/11547101f08068fd89fff6e86941118b/dotnet-sdk-#{version.before_comma}-osx-x64.pkg"
        sha256 "a3f75ee1661b4c882174c5452365a10705f5c3a2fda5d5e6077a9a4c3c9aebeb"
        pkg "dotnet-sdk-7.0.100-preview.3.22179.4-osx-x64.pkg"
    else
        url "https://download.visualstudio.microsoft.com/download/pr/3b73829a-6e68-487d-ace5-f96b993f2383/9f1e0a9d4414c9aae6ce64b4f8c620c5/dotnet-sdk-#{version.before_comma}-osx-arm64.pkg"
        sha256 "7c4d779addb6c379c68fd1d3c2afa532063747097c7f5ef13d4815720e4f1ac9"
        pkg "dotnet-sdk-7.0.100-preview.3.22179.4-osx-arm64.pkg"
    end

    name ".NET SDK 7.0.100-preview.3.22179.4,7.0.0-preview.3"
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
