cask "dotnet-sdk-3-1-301" do
    version "3.1.301,3.1.5"
    
    url "https://download.visualstudio.microsoft.com/download/pr/aad9adc7-90bb-4294-a378-00f4cc5fb695/89cfc771a783b1441c34ac925aee7141/dotnet-sdk-#{version.before_comma}-osx-x64.pkg"
    sha256 "c4803f33943c35c10607e13cd80611230e134324752450c6880ef4a24aa8497e"
    pkg "dotnet-sdk-3.1.301-osx-x64.pkg"

    name ".NET Core SDK 3.1.301,3.1.5"
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

    zap trash: ["~/.dotnet", "~/.nuget"]
end
