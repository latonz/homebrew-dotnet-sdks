cask "dotnet-sdk-2-2-200-preview-009648" do
    version "2.2.200-preview-009648,2.2.200-preview"
    
    url "https://download.visualstudio.microsoft.com/download/pr/5f76180d-a776-4bec-998b-a27ff8242611/9649baa9f464666831321b41e05485e8/dotnet-sdk-#{version.before_comma}-osx-gs-x64.pkg"
    sha256 "d67b12f5eac65951f83448f4646eca980974d8bf37db70a68f9e7f382b8042f7"
    pkg "dotnet-sdk-2.2.200-preview-009648-osx-gs-x64.pkg"

    name ".NET Core SDK 2.2.200-preview-009648,2.2.200-preview"
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
