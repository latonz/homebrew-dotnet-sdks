cask "dotnet-sdk-8-0-204" do
    version "8.0.204,8.0.4"
    
    if Hardware::CPU.intel?
        url "https://download.visualstudio.microsoft.com/download/pr/7bcf1329-6691-45e9-8fdd-96c65bcabd1f/cb618d2620974fc029e4f758eb267452/dotnet-sdk-#{version.before_comma}-osx-x64.pkg"
        sha256 "cfc35a77cb675ebeb31570b723b58514f68c0034bb4194d7b40523cd2b819455"
        pkg "dotnet-sdk-8.0.204-osx-x64.pkg"
    else
        url "https://download.visualstudio.microsoft.com/download/pr/a1b04e7e-464d-45f6-ac93-f8901c46c247/7acd4fa3f321aaec4598a1492cc745c6/dotnet-sdk-#{version.before_comma}-osx-arm64.pkg"
        sha256 "9c41150210de26549d520cb274cdc4b6db24ee7168a150b0465adf18828ee348"
        pkg "dotnet-sdk-8.0.204-osx-arm64.pkg"
    end

    name ".NET SDK 8.0.204,8.0.4"
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