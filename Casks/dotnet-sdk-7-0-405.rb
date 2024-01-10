cask "dotnet-sdk-7-0-405" do
    version "7.0.405,7.0.15"
    
    if Hardware::CPU.intel?
        url "https://download.visualstudio.microsoft.com/download/pr/f8586b3c-a8dc-46b7-9079-c04a5d39e446/9e31c12cea5d52ada35d0603943e9b36/dotnet-sdk-#{version.before_comma}-osx-x64.pkg"
        sha256 "0756db7bed489a37d9a62a5fed001034ca4fe44a6070e27787358305b6f3b5e5"
        pkg "dotnet-sdk-7.0.405-osx-x64.pkg"
    else
        url "https://download.visualstudio.microsoft.com/download/pr/efa1aae9-9574-4095-b220-900f3b6ee883/10838cb66603fa4cc0f02ae9d2317c56/dotnet-sdk-#{version.before_comma}-osx-arm64.pkg"
        sha256 "a0897b16a56af46633836506856c747c377fcbd347cd2e1788e837c991a4f0d7"
        pkg "dotnet-sdk-7.0.405-osx-arm64.pkg"
    end

    name ".NET SDK 7.0.405,7.0.15"
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
