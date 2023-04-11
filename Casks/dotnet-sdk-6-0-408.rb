cask "dotnet-sdk-6-0-408" do
    version "6.0.408,6.0.16"
    
    if Hardware::CPU.intel?
        url "https://download.visualstudio.microsoft.com/download/pr/4909fc6d-8655-437d-b436-74fc180d12e6/24de71d15ed7bcf02ff8f96fff6a2f54/dotnet-sdk-#{version.before_comma}-osx-x64.pkg"
        sha256 "917ec757e0e6f8c6fc17b5aeed54b49047b724a4bfb667ee0e23776ae755ced0"
        pkg "dotnet-sdk-6.0.408-osx-x64.pkg"
    else
        url "https://download.visualstudio.microsoft.com/download/pr/d314a89e-8bfa-4b7d-876b-9df41ec12a53/37ebf6170857ab5da80a02d4ec8a3364/dotnet-sdk-#{version.before_comma}-osx-arm64.pkg"
        sha256 "35ca20ed7c4a94d1c99bc5f2cad43ddb2e4bbb3b80e2f5bffc378d1c85ceebf1"
        pkg "dotnet-sdk-6.0.408-osx-arm64.pkg"
    end

    name ".NET SDK 6.0.408,6.0.16"
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
