cask "dotnet-sdk-3-1-100-preview3-014645" do
    version "3.1.100-preview3-014645,3.1.0-preview3"
    
    url "https://download.visualstudio.microsoft.com/download/pr/f4377189-a171-425b-8ef6-f8f21e89a8b0/b0d3561b13bd43ab4771bb62a2fddd4d/dotnet-sdk-#{version.before_comma}-osx-x64.pkg"
    sha256 "61fd5b2630a3ac536cfbf66172f62a246ccf87c7fe7988b188e257089eb0a4aa"
    pkg "dotnet-sdk-3.1.100-preview3-014645-osx-x64.pkg"

    name ".NET Core SDK 3.1.100-preview3-014645,3.1.0-preview3"
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
