cask "dotnet-sdk-11-0-100-preview-5-26302-115" do
    version "11.0.100-preview.5.26302.115,11.0.0-preview.5"
    
    if Hardware::CPU.intel?
        url "https://builds.dotnet.microsoft.com/dotnet/Sdk/#{version.before_comma}/dotnet-sdk-#{version.before_comma}-osx-x64.pkg"
        sha256 "E8F712518E970547B71B939A986030410C48F5D2537BE94A0D04CC8C110B2891"
        pkg "dotnet-sdk-11.0.100-preview.5.26302.115-osx-x64.pkg"
    else
        url "https://builds.dotnet.microsoft.com/dotnet/Sdk/#{version.before_comma}/dotnet-sdk-#{version.before_comma}-osx-arm64.pkg"
        sha256 "0EA0B1083A8BE0677A96337766B02FA983971205FD1547C4C4E96391D5EAE20E"
        pkg "dotnet-sdk-11.0.100-preview.5.26302.115-osx-arm64.pkg"
    end

    name ".NET SDK 11.0.100-preview.5.26302.115,11.0.0-preview.5"
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