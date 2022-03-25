cask "dotnet-sdk-2-1-300-preview1-008174" do
    version "2.1.300-preview1-008174,2.1.0-preview1"
    
    url "https://download.microsoft.com/download/D/7/8/D788D3CD-44C4-487D-829B-413E914FB1C3/dotnet-sdk-#{version.before_comma}-osx-x64.pkg"
    sha256 "d7f8e1058331cbaf275363b9acdb6d72bc46a90a3d8fe4af19977edfd7eb3fc9"
    pkg "dotnet-sdk-2.1.300-preview1-008174-osx-x64.pkg"

    name ".NET Core SDK 2.1.300-preview1-008174,2.1.0-preview1"
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
