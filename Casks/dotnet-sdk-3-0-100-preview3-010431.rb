cask "dotnet-sdk-3-0-100-preview3-010431" do
    version "3.0.100-preview3-010431,3.0.0-preview3"
    
    url "https://download.visualstudio.microsoft.com/download/pr/1596788d-f5c8-451f-8587-dd583ad7db3c/f3038ad1cd239af046ef0d47b01602a9/dotnet-sdk-#{version.before_comma}-osx-gs-x64.pkg"
    sha256 "812827b5a7a38124a6f449ebe52ecbd17a485864849b637424d3660c7bc28e43"
    pkg "dotnet-sdk-3.0.100-preview3-010431-osx-gs-x64.pkg"

    name ".NET Core SDK 3.0.100-preview3-010431,3.0.0-preview3"
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
