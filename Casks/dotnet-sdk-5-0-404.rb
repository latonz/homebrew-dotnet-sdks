cask "dotnet-sdk-5-0-404" do
    version "5.0.404,5.0.13"
    
    url "https://download.visualstudio.microsoft.com/download/pr/8e682576-6d5e-4702-aed4-b7f77bb0dbc3/c7269d8dc54d73fbba942f38da843f60/dotnet-sdk-#{version.before_comma}-osx-x64.pkg"
    sha256 "19c0b93790fbc90ee39e11b9d304a91f1bc37468ab56076dba46b6e68b520385"
    pkg "dotnet-sdk-5.0.404-osx-x64.pkg"

    name ".NET SDK 5.0.404,5.0.13"
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
