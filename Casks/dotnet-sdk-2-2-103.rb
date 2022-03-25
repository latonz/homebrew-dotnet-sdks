cask "dotnet-sdk-2-2-103" do
    version "2.2.103,2.2.103"
    
    url "https://download.visualstudio.microsoft.com/download/pr/5b55396f-9166-4273-96a9-cc9c176bb2bb/6f7de3a3006a193a5adf4799dfe79019/dotnet-sdk-#{version.before_comma}-osx-gs-x64.pkg"
    sha256 "ed4c1c70661a5f65615659880b8615d611ea31aea6270d491c52042116424e49"
    pkg "dotnet-sdk-2.2.103-osx-gs-x64.pkg"

    name ".NET Core SDK 2.2.103,2.2.103"
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
