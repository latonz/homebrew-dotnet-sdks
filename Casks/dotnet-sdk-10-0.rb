cask "dotnet-sdk-10-0" do
    version "10.0.100-rc.2.25502.107,10.0.0-rc.2"
    
    if Hardware::CPU.intel?
        url "https://builds.dotnet.microsoft.com/dotnet/Sdk/#{version.before_comma}/dotnet-sdk-#{version.before_comma}-osx-x64.pkg"
        sha256 "6E89BA33AA1BBAAAF3B108195E14E3AC317DE9675788F3E58AB1C7B1A8C851B1"
        pkg "dotnet-sdk-10.0.100-rc.2.25502.107-osx-x64.pkg"
    else
        url "https://builds.dotnet.microsoft.com/dotnet/Sdk/#{version.before_comma}/dotnet-sdk-#{version.before_comma}-osx-arm64.pkg"
        sha256 "CDA7F488455749CFB33EDE260D0A25715BD7B3588F67A3514107D76634E19C27"
        pkg "dotnet-sdk-10.0.100-rc.2.25502.107-osx-arm64.pkg"
    end

    name ".NET SDK 10.0.100-rc.2.25502.107,10.0.0-rc.2"
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