cask "dotnet-sdk-8-0-100-preview-7-23376-3" do
    version "8.0.100-preview.7.23376.3,8.0.0-preview.7"
    
    if Hardware::CPU.intel?
        url "https://download.visualstudio.microsoft.com/download/pr/392f3d3a-fdb0-4c32-a89a-da83a9e48611/ff71d6b20895b10a909986a92b5ed011/dotnet-sdk-#{version.before_comma}-osx-x64.pkg"
        sha256 "46c591243d4a56f39b42113137f06f52b0cd0074cefffd922986941385bf4ae6"
        pkg "dotnet-sdk-8.0.100-preview.7.23376.3-osx-x64.pkg"
    else
        url "https://download.visualstudio.microsoft.com/download/pr/bf548fae-7cf9-4fe3-8414-a70134685591/00af1befa829b764d78a8a83b5b652f0/dotnet-sdk-#{version.before_comma}-osx-arm64.pkg"
        sha256 "a217fe3d87533c146adbc5b41faa856bfff3ca176a86044c077f159a31b64ceb"
        pkg "dotnet-sdk-8.0.100-preview.7.23376.3-osx-arm64.pkg"
    end

    name ".NET SDK 8.0.100-preview.7.23376.3,8.0.0-preview.7"
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
