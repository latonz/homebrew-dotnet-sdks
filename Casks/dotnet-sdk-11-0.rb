cask "dotnet-sdk-11-0" do
    version "11.0.100-preview.3.26207.106,11.0.0-preview.3"
    
    if Hardware::CPU.intel?
        url "https://builds.dotnet.microsoft.com/dotnet/Sdk/#{version.before_comma}/dotnet-sdk-#{version.before_comma}-osx-x64.pkg"
        sha256 "67BC00D1EF6091546B5F6EFA0BEC81A0DB6929ACFDF3889FB407B2E47E5074AF"
        pkg "dotnet-sdk-11.0.100-preview.3.26207.106-osx-x64.pkg"
    else
        url "https://builds.dotnet.microsoft.com/dotnet/Sdk/#{version.before_comma}/dotnet-sdk-#{version.before_comma}-osx-arm64.pkg"
        sha256 "468D77024E79AAFA795D07D265BDAB4B189FBECCACF5B1E5D2BC0270E5CF484C"
        pkg "dotnet-sdk-11.0.100-preview.3.26207.106-osx-arm64.pkg"
    end

    name ".NET SDK 11.0.100-preview.3.26207.106,11.0.0-preview.3"
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