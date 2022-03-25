cask "dotnet-sdk-2-1-507" do
    version "2.1.507,2.1.11"
    
    url "https://download.visualstudio.microsoft.com/download/pr/9b2b766b-a766-4743-b9b4-10d5ed6b2054/76a960f32b4f9d1eee6982abe8032fe5/dotnet-sdk-#{version.before_comma}-osx-gs-x64.pkg"
    sha256 "e21be8e5974f3b5379811719724c07c2ef1a9f1c32d1981742b71c3395b9c625"
    pkg "dotnet-sdk-2.1.507-osx-gs-x64.pkg"

    name ".NET Core SDK 2.1.507,2.1.11"
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
