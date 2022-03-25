cask "dotnet-sdk-2-2-100-preview3-009430" do
    version "2.2.100-preview3-009430,2.2.0-preview3"
    
    url "https://download.visualstudio.microsoft.com/download/pr/e9e064db-72cc-490d-b77e-f330477a17a9/256980ac49fdcac3174deb3551224fd3/dotnet-sdk-#{version.before_comma}-osx-x64.pkg"
    sha256 "d7ddbaa51af3cc3771cee959635840ca0f06cc8e3d795d1ede04fa4b16835009"
    pkg "dotnet-sdk-2.2.100-preview3-009430-osx-x64.pkg"

    name ".NET Core SDK 2.2.100-preview3-009430,2.2.0-preview3"
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
