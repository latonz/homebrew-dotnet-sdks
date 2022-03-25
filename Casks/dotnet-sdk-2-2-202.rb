cask "dotnet-sdk-2-2-202" do
    version "2.2.202,2.2.202"
    
    url "https://download.visualstudio.microsoft.com/download/pr/54e73358-c5fd-4e68-9548-547825bb1f25/2b07be8d371c4919b0bea186f6e5d4fe/dotnet-sdk-#{version.before_comma}-osx-gs-x64.pkg"
    sha256 "bea5d9355b2f9caacec0a7cb85fd813efed2ab269b97cea5454c6396c9e418a0"
    pkg "dotnet-sdk-2.2.202-osx-gs-x64.pkg"

    name ".NET Core SDK 2.2.202,2.2.202"
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
