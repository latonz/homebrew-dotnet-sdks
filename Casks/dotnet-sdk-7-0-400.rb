cask "dotnet-sdk-7-0-400" do
    version "7.0.400,7.0.10"
    
    if Hardware::CPU.intel?
        url "https://download.visualstudio.microsoft.com/download/pr/f4c17ae1-56c5-4d79-8ce2-31c46a861a96/e39ebd96c092d4acb394c864aa0c8eaa/dotnet-sdk-#{version.before_comma}-osx-x64.pkg"
        sha256 "058b3d135221ee4814211d320934d181dec2a07dd305d07513336ba3ffec8846"
        pkg "dotnet-sdk-7.0.400-osx-x64.pkg"
    else
        url "https://download.visualstudio.microsoft.com/download/pr/006fcd0f-5c39-462b-8425-8af5c66915d0/de20d3b86725a79b7d0de0f3f9c86b05/dotnet-sdk-#{version.before_comma}-osx-arm64.pkg"
        sha256 "e00d9505312d8819baafa45f5676b1825e85cef86ff77d0fd2828c2c750a0c71"
        pkg "dotnet-sdk-7.0.400-osx-arm64.pkg"
    end

    name ".NET SDK 7.0.400,7.0.10"
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
