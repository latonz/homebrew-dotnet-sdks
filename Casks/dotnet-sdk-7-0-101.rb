cask "dotnet-sdk-7-0-101" do
    version "7.0.101,7.0.1"
    
    if Hardware::CPU.intel?
        url "https://download.visualstudio.microsoft.com/download/pr/937c147f-28e2-4f09-b775-c3e3f910fa92/d44e678722d66d028061cd3cf09bfebd/dotnet-sdk-#{version.before_comma}-osx-x64.pkg"
        sha256 "7777f0e6db89fc8cea9f8c6965fe4b41a0cf316d1f064ae2f3de8462abd4af97"
        pkg "dotnet-sdk-7.0.101-osx-x64.pkg"
    else
        url "https://download.visualstudio.microsoft.com/download/pr/ea9de698-864c-4ddb-8ff3-1bf068c6b1a7/cf5d147f2c167317394058deb4d4b0a7/dotnet-sdk-#{version.before_comma}-osx-arm64.pkg"
        sha256 "7a4f491a3f587a18b1249162bccc72157ed8bdb5600bdef32caeaa374a71f548"
        pkg "dotnet-sdk-7.0.101-osx-arm64.pkg"
    end

    name ".NET SDK 7.0.101,7.0.1"
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
