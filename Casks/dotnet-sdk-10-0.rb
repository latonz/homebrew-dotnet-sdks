cask "dotnet-sdk-10-0" do
    version "10.0.100-rc.1.25451.107,10.0.0-rc.1"
    
    if Hardware::CPU.intel?
        url "https://builds.dotnet.microsoft.com/dotnet/Sdk/#{version.before_comma}/dotnet-sdk-#{version.before_comma}-osx-x64.pkg"
        sha256 "00B5D3054F19D4A82862DFB9E7357132D985EFFD397CDF4E68B2C3BAD93EB817"
        pkg "dotnet-sdk-10.0.100-rc.1.25451.107-osx-x64.pkg"
    else
        url "https://builds.dotnet.microsoft.com/dotnet/Sdk/#{version.before_comma}/dotnet-sdk-#{version.before_comma}-osx-arm64.pkg"
        sha256 "DE5E3009F820E52B179028A71623A26CEA1D8941C799EA46CE3A669127F0847D"
        pkg "dotnet-sdk-10.0.100-rc.1.25451.107-osx-arm64.pkg"
    end

    name ".NET SDK 10.0.100-rc.1.25451.107,10.0.0-rc.1"
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