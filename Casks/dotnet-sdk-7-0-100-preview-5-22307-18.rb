cask "dotnet-sdk-7-0-100-preview-5-22307-18" do
    version "7.0.100-preview.5.22307.18,7.0.0-preview.5"
    
    if Hardware::CPU.intel?
        url "https://download.visualstudio.microsoft.com/download/pr/eb929c1e-1148-49fe-ab31-a711a678a023/f8b7c7eaec03e178e8a515ce8a3a7955/dotnet-sdk-#{version.before_comma}-osx-x64.pkg"
        sha256 "edb588842b5be03fbce29e13ff6d262236c785704cf6af3ba5543ac12596cf0a"
        pkg "dotnet-sdk-7.0.100-preview.5.22307.18-osx-x64.pkg"
    else
        url "https://download.visualstudio.microsoft.com/download/pr/d8afcb7b-07c8-4834-8dc7-44e67d4db713/25de501bb6482bfee466cec9426af845/dotnet-sdk-#{version.before_comma}-osx-arm64.pkg"
        sha256 "a409de757b4103ae2c3591ece493554c001361053fbceff16cf02f20e4a59df1"
        pkg "dotnet-sdk-7.0.100-preview.5.22307.18-osx-arm64.pkg"
    end

    name ".NET SDK 7.0.100-preview.5.22307.18,7.0.0-preview.5"
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
