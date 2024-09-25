cask "dotnet-sdk-8-0-402" do
    version "8.0.402,8.0.8"
    
    if Hardware::CPU.intel?
        url "https://download.visualstudio.microsoft.com/download/pr/b98e1dbc-5ba2-446c-b294-0cd01392a91d/13afc1c75aa0baa437f4710a2a6cb2e9/dotnet-sdk-#{version.before_comma}-osx-x64.pkg"
        sha256 "7e4121cbc738790ba28367e91834ee8758cb2c913eba9e7bb6e64c8306236905"
        pkg "dotnet-sdk-8.0.402-osx-x64.pkg"
    else
        url "https://download.visualstudio.microsoft.com/download/pr/0fb159d5-d255-43ad-bd15-6f8b0787b884/841e854f82f94d29d70980f7775212b7/dotnet-sdk-#{version.before_comma}-osx-arm64.pkg"
        sha256 "00bf6b7a7451865d40f604e7ce9418671d5db6652863d9095a2ad322b952a792"
        pkg "dotnet-sdk-8.0.402-osx-arm64.pkg"
    end

    name ".NET SDK 8.0.402,8.0.8"
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