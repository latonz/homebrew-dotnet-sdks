cask "dotnet-sdk-8-0-418" do
    version "8.0.418,8.0.24"
    
    if Hardware::CPU.intel?
        url "https://builds.dotnet.microsoft.com/dotnet/Sdk/#{version.before_comma}/dotnet-sdk-#{version.before_comma}-osx-x64.pkg"
        sha256 "2A982DAB33F6E7BF5AAF3492325D1E33CD7BDF5BCD3A4AEE62F068F36449BF1B"
        pkg "dotnet-sdk-8.0.418-osx-x64.pkg"
    else
        url "https://builds.dotnet.microsoft.com/dotnet/Sdk/#{version.before_comma}/dotnet-sdk-#{version.before_comma}-osx-arm64.pkg"
        sha256 "70A6E5882CE32E000CB157F47E44C8E4AF7D9CE30816B1FF2F2BB2AACD29804F"
        pkg "dotnet-sdk-8.0.418-osx-arm64.pkg"
    end

    name ".NET SDK 8.0.418,8.0.24"
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