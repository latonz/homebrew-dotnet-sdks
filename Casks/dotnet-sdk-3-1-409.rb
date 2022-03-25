cask "dotnet-sdk-3-1-409" do
    version "3.1.409,3.1.15"
    
    url "https://download.visualstudio.microsoft.com/download/pr/964ae449-a8b8-46d1-b944-c54f6e1bf8fc/f0cbcb2df3409d865b62f0c02a9ebbb9/dotnet-sdk-#{version.before_comma}-osx-x64.pkg"
    sha256 "03436390065acc62b8ebdc01689f07d0f9229111949014e670694d2eea8f4ba6"
    pkg "dotnet-sdk-3.1.409-osx-x64.pkg"

    name ".NET Core SDK 3.1.409,3.1.15"
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
