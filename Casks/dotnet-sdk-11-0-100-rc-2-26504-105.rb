cask "dotnet-sdk-11-0-100-rc-2-26504-105" do
    version "11.0.100-rc.2.26504.105,11.0.0-rc.2"
    
    if Hardware::CPU.intel?
        url "https://builds.dotnet.microsoft.com/dotnet/Sdk/#{version.before_comma}/dotnet-sdk-#{version.before_comma}-osx-x64.pkg"
        sha256 "45C1C0B9F3D975CA6B0554297079516B00F55EF55096818F100648FDCDF1A77F"
        pkg "dotnet-sdk-11.0.100-rc.2.26504.105-osx-x64.pkg"
    else
        url "https://builds.dotnet.microsoft.com/dotnet/Sdk/#{version.before_comma}/dotnet-sdk-#{version.before_comma}-osx-arm64.pkg"
        sha256 "0D3D2F88A476B69D9B7C7D0B92A218FC63B415D52D49E4698D739B2B877F98EC"
        pkg "dotnet-sdk-11.0.100-rc.2.26504.105-osx-arm64.pkg"
    end

    name ".NET SDK 11.0.100-rc.2.26504.105,11.0.0-rc.2"
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