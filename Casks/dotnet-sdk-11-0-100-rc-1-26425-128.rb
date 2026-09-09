cask "dotnet-sdk-11-0-100-rc-1-26425-128" do
    version "11.0.100-rc.1.26425.128,11.0.0-rc.1"
    
    if Hardware::CPU.intel?
        url "https://builds.dotnet.microsoft.com/dotnet/Sdk/#{version.before_comma}/dotnet-sdk-#{version.before_comma}-osx-x64.pkg"
        sha256 "3421B627C066B5EEA0A47C349B761BD3028E7539C65EB328E271B594366524CF"
        pkg "dotnet-sdk-11.0.100-rc.1.26425.128-osx-x64.pkg"
    else
        url "https://builds.dotnet.microsoft.com/dotnet/Sdk/#{version.before_comma}/dotnet-sdk-#{version.before_comma}-osx-arm64.pkg"
        sha256 "2088706D2AC3CBF942DB9B690441E86FDC9576135C1E1A336D165C490A69DB74"
        pkg "dotnet-sdk-11.0.100-rc.1.26425.128-osx-arm64.pkg"
    end

    name ".NET SDK 11.0.100-rc.1.26425.128,11.0.0-rc.1"
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