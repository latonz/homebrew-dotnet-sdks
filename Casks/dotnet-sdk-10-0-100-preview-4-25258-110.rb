cask "dotnet-sdk-10-0-100-preview-4-25258-110" do
    version "10.0.100-preview.4.25258.110,10.0.0-preview.4"
    
    if Hardware::CPU.intel?
        url "https://builds.dotnet.microsoft.com/dotnet/Sdk/#{version.before_comma}/dotnet-sdk-#{version.before_comma}-osx-x64.pkg"
        sha256 "ca30b4ecbd8c2fe391cf505f0c2cebf51fa9ba9ecad02ba4e53cd87ec5273b88"
        pkg "dotnet-sdk-10.0.100-preview.4.25258.110-osx-x64.pkg"
    else
        url "https://builds.dotnet.microsoft.com/dotnet/Sdk/#{version.before_comma}/dotnet-sdk-#{version.before_comma}-osx-arm64.pkg"
        sha256 "19b626bf24f7520570573a5f9f5dba046f7bf3e03adcc72552ea4e96206b02bc"
        pkg "dotnet-sdk-10.0.100-preview.4.25258.110-osx-arm64.pkg"
    end

    name ".NET SDK 10.0.100-preview.4.25258.110,10.0.0-preview.4"
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