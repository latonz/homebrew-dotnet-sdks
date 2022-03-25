cask "dotnet-sdk-3-1-407" do
    version "3.1.407,3.1.13"
    
    url "https://download.visualstudio.microsoft.com/download/pr/ecd4efe6-5f37-4183-82a1-dd2de88ca573/144bb23aab65c4439d0600973d756e6b/dotnet-sdk-#{version.before_comma}-osx-x64.pkg"
    sha256 "e65bd0a99365d494a07983f33346597db220dc3e199acc1aedde3dd0d3795750"
    pkg "dotnet-sdk-3.1.407-osx-x64.pkg"

    name ".NET Core SDK 3.1.407,3.1.13"
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
