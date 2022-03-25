cask "dotnet-sdk-2-1-607" do
    version "2.1.607,2.1.14"
    
    url "https://download.visualstudio.microsoft.com/download/pr/d9205c1f-f66e-4c01-8fc4-402876d8abb3/d73987eff8812ac44fe86fc2be12eb52/dotnet-sdk-#{version.before_comma}-osx-gs-x64.pkg"
    sha256 "8f0921b50cd35c393728ab0272f44bd986eccf1ca6bfa841dccb25ebd232c178"
    pkg "dotnet-sdk-2.1.607-osx-gs-x64.pkg"

    name ".NET Core SDK 2.1.607,2.1.14"
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
