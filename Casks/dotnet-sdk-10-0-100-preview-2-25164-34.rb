cask "dotnet-sdk-10-0-100-preview-2-25164-34" do
    version "10.0.100-preview.2.25164.34,10.0.0-preview.2"
    
    if Hardware::CPU.intel?
        url "https://download.visualstudio.microsoft.com/download/pr/b4939084-2f13-4db2-a1f9-e0bb92fa6444/f7ddf601828529880e744e9f1665a8c6/dotnet-sdk-#{version.before_comma}-osx-x64.pkg"
        sha256 "88b359654b9b6ec99760a9eaf65031c5007847ffa589642113614e37ea8fb340"
        pkg "dotnet-sdk-10.0.100-preview.2.25164.34-osx-x64.pkg"
    else
        url "https://download.visualstudio.microsoft.com/download/pr/682dfc93-051e-4e97-9fdd-04bc94c60128/f8564986e2a2ce732dacdee33fb9be5a/dotnet-sdk-#{version.before_comma}-osx-arm64.pkg"
        sha256 "45b765830e28c14b4e4a230b34f02f4918d2d5ac0d2063e95c57b964aeb10da1"
        pkg "dotnet-sdk-10.0.100-preview.2.25164.34-osx-arm64.pkg"
    end

    name ".NET SDK 10.0.100-preview.2.25164.34,10.0.0-preview.2"
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