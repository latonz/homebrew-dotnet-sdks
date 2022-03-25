cask "dotnet-sdk-6-0-100-rc-2-21505-57" do
    version "6.0.100-rc.2.21505.57,6.0.0-rc.2"
    
    if Hardware::CPU.intel?
        url "https://download.visualstudio.microsoft.com/download/pr/c5dd0b51-0059-442b-9456-b03cb7ee277d/6d78d81224db93247ff6ae0bdb929712/dotnet-sdk-#{version.before_comma}-osx-x64.pkg"
        sha256 "9e6af3188da140b42919879ec38b9d7da9607fa65e2f6581be3ca31ece27ef03"
        pkg "dotnet-sdk-6.0.100-rc.2.21505.57-osx-x64.pkg"
    else
        url "https://download.visualstudio.microsoft.com/download/pr/3336b6fe-1f40-4c66-a1ef-81cabd3df46c/dd56dc201e5c0a95b86f41c1cf36df17/dotnet-sdk-#{version.before_comma}-osx-arm64.pkg"
        sha256 "4db0bb52f7cd6cfd3969a8b24ea4d09b851a9d3243915798e3f3d0c48308370e"
        pkg "dotnet-sdk-6.0.100-rc.2.21505.57-osx-arm64.pkg"
    end

    name ".NET SDK 6.0.100-rc.2.21505.57,6.0.0-rc.2"
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
