cask "dotnet-sdk-5-0" do
    version "5.0.407,5.0.16"
    
    url "https://download.visualstudio.microsoft.com/download/pr/b5abafee-b221-4765-857f-06c60e99d9e9/29d8b1073f7da4e19606ff4f116450f6/dotnet-sdk-#{version.before_comma}-osx-x64.pkg"
    sha256 "c5719b150c093eb5b8c487a372643e9630f59d3d318250286f29217c41e72e37"
    pkg "dotnet-sdk-5.0.407-osx-x64.pkg"

    name ".NET SDK 5.0.407,5.0.16"
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
