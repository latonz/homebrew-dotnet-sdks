cask "dotnet-sdk-6-0-427" do
    version "6.0.427,6.0.35"
    
    if Hardware::CPU.intel?
        url "https://download.visualstudio.microsoft.com/download/pr/82d434e3-1910-40be-bf9e-a4ed5439d336/259a9d70a9bc501a73d167fa473e8fda/dotnet-sdk-#{version.before_comma}-osx-x64.pkg"
        sha256 "0cdbb4e556df7ec2dec8ac32c03ddb295f4f113fe27997f201b6b6781f6d63c6"
        pkg "dotnet-sdk-6.0.427-osx-x64.pkg"
    else
        url "https://download.visualstudio.microsoft.com/download/pr/00530a6e-d2da-4c65-aa81-24cd1b8d7012/1213e0922920e0939d81f3d687a49725/dotnet-sdk-#{version.before_comma}-osx-arm64.pkg"
        sha256 "32d5651e8e67b929f43f00abcee89b45beb409c094479a0e41087bc342c8ee46"
        pkg "dotnet-sdk-6.0.427-osx-arm64.pkg"
    end

    name ".NET SDK 6.0.427,6.0.35"
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