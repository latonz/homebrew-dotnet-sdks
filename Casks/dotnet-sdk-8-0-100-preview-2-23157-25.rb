cask "dotnet-sdk-8-0-100-preview-2-23157-25" do
    version "8.0.100-preview.2.23157.25,8.0.0-preview.2"
    
    if Hardware::CPU.intel?
        url "https://download.visualstudio.microsoft.com/download/pr/d22c5e44-5ddc-41c2-bc23-cc7cbf7bed72/25e24c6de0c41648965533073cfba2c2/dotnet-sdk-#{version.before_comma}-osx-x64.pkg"
        sha256 "29a7257a16a5cdaa2e7dd7da4a496e18f4bada93927da048b1bb5ae96ade7e7f"
        pkg "dotnet-sdk-8.0.100-preview.2.23157.25-osx-x64.pkg"
    else
        url "https://download.visualstudio.microsoft.com/download/pr/9bb7054e-4547-4021-b46f-edee2428b10d/1dbe4945aabec0cd9c8b15080ec98b37/dotnet-sdk-#{version.before_comma}-osx-arm64.pkg"
        sha256 "e6ce9caf13bc7770b34e5aec38150db1836b6e3b9e137729a050d5e37c2a7e45"
        pkg "dotnet-sdk-8.0.100-preview.2.23157.25-osx-arm64.pkg"
    end

    name ".NET SDK 8.0.100-preview.2.23157.25,8.0.0-preview.2"
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
