cask "dotnet-sdk-8-0-100-preview-3-23178-7" do
    version "8.0.100-preview.3.23178.7,8.0.0-preview.3"
    
    if Hardware::CPU.intel?
        url "https://download.visualstudio.microsoft.com/download/pr/199b3c2b-0840-4c91-ab2e-5d5a740d1f07/f8669fcc04fc2a171121cfc7764f299c/dotnet-sdk-#{version.before_comma}-osx-x64.pkg"
        sha256 "ac7549f4e84f4c2ad0dedfb603044bc16821f56204ca7ac1faaa083385db9adf"
        pkg "dotnet-sdk-8.0.100-preview.3.23178.7-osx-x64.pkg"
    else
        url "https://download.visualstudio.microsoft.com/download/pr/3fa4c32e-6c76-4055-b6ea-e9dee2785da9/117d47e8b1cbbaa762390b30329e935f/dotnet-sdk-#{version.before_comma}-osx-arm64.pkg"
        sha256 "aab199305069727ed7a3c13033d26a04249e41eb98a909d60caeaa0cda6d32fa"
        pkg "dotnet-sdk-8.0.100-preview.3.23178.7-osx-arm64.pkg"
    end

    name ".NET SDK 8.0.100-preview.3.23178.7,8.0.0-preview.3"
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
