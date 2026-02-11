cask "dotnet-sdk-11-0-100-preview-1-26104-118" do
    version "11.0.100-preview.1.26104.118,11.0.0-preview.1"
    
    if Hardware::CPU.intel?
        url "https://builds.dotnet.microsoft.com/dotnet/Sdk/#{version.before_comma}/dotnet-sdk-#{version.before_comma}-osx-x64.pkg"
        sha256 "B0E20F25CB0CC7464D77EFCF29AB262129EC7E1D18193E616BB50816476EC1D4"
        pkg "dotnet-sdk-11.0.100-preview.1.26104.118-osx-x64.pkg"
    else
        url "https://builds.dotnet.microsoft.com/dotnet/Sdk/#{version.before_comma}/dotnet-sdk-#{version.before_comma}-osx-arm64.pkg"
        sha256 "B30A0EDA2DCCD514421FA1BD22D1AA691FC6A857AF5350968101B56DFA515BD4"
        pkg "dotnet-sdk-11.0.100-preview.1.26104.118-osx-arm64.pkg"
    end

    name ".NET SDK 11.0.100-preview.1.26104.118,11.0.0-preview.1"
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