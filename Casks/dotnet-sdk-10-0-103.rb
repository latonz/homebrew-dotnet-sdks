cask "dotnet-sdk-10-0-103" do
    version "10.0.103,10.0.3"
    
    if Hardware::CPU.intel?
        url "https://builds.dotnet.microsoft.com/dotnet/Sdk/#{version.before_comma}/dotnet-sdk-#{version.before_comma}-osx-x64.pkg"
        sha256 "E38E49B39D439ECC7F863341F7AE76E0BA7816951511B57E797B8949164D8EB7"
        pkg "dotnet-sdk-10.0.103-osx-x64.pkg"
    else
        url "https://builds.dotnet.microsoft.com/dotnet/Sdk/#{version.before_comma}/dotnet-sdk-#{version.before_comma}-osx-arm64.pkg"
        sha256 "B0FFBA0C7BD785E79F5C22EDE3D77322188C15A7403EB53BD7A394F7C7B250D1"
        pkg "dotnet-sdk-10.0.103-osx-arm64.pkg"
    end

    name ".NET SDK 10.0.103,10.0.3"
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

    zap trash: ["~/.dotnet", "~/.nuget", "/etc/paths.d/dotnet", "/etc/paths.d/dotnet-cli-tools"]
end