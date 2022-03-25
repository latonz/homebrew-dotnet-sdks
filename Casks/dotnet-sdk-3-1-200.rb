cask "dotnet-sdk-3-1-200" do
    version "3.1.200,3.1.2"
    
    url "https://download.visualstudio.microsoft.com/download/pr/fd4c60cd-04a0-4175-ad80-e05d3d90e45e/e7e55bd77cdd6cc99c4ff37dc6fe1ce2/dotnet-sdk-#{version.before_comma}-osx-x64.pkg"
    sha256 "b449d65253985b97f2bd27c8ae18fc859a5a20aaa99fea2d5f4005522424f8f5"
    pkg "dotnet-sdk-3.1.200-osx-x64.pkg"

    name ".NET Core SDK 3.1.200,3.1.2"
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
