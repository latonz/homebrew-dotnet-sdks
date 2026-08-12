cask "dotnet-sdk-11-0" do
    version "11.0.100-preview.7.26381.103,11.0.0-preview.7"
    
    if Hardware::CPU.intel?
        url "https://builds.dotnet.microsoft.com/dotnet/Sdk/#{version.before_comma}/dotnet-sdk-#{version.before_comma}-osx-x64.pkg"
        sha256 "1306C0758625ED38B4AB4A83B81F7B7BD075389DE8B2D76DD773E20C4EAD8EA7"
        pkg "dotnet-sdk-11.0.100-preview.7.26381.103-osx-x64.pkg"
    else
        url "https://builds.dotnet.microsoft.com/dotnet/Sdk/#{version.before_comma}/dotnet-sdk-#{version.before_comma}-osx-arm64.pkg"
        sha256 "DF7704195094F778ABD9D862288AC61D141EE0BD47B4FF66ADD4BB9078BD0201"
        pkg "dotnet-sdk-11.0.100-preview.7.26381.103-osx-arm64.pkg"
    end

    name ".NET SDK 11.0.100-preview.7.26381.103,11.0.0-preview.7"
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