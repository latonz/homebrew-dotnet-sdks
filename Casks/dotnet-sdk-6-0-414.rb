cask "dotnet-sdk-6-0-414" do
    version "6.0.414,6.0.22"
    
    if Hardware::CPU.intel?
        url "https://download.visualstudio.microsoft.com/download/pr/1de3975a-e76b-4524-9584-b01d2c8db33e/4a05072624690d3b0167493cbb3d7757/dotnet-sdk-#{version.before_comma}-osx-x64.pkg"
        sha256 "0bb807630047ec7afc4014b810bf4d859e0d7a5637996959a5efb4f72efee95d"
        pkg "dotnet-sdk-6.0.414-osx-x64.pkg"
    else
        url "https://download.visualstudio.microsoft.com/download/pr/6936c1ed-530d-4b1d-898e-1f27e5109c5a/a8f73f24b9103d0a64ca42f1462b0954/dotnet-sdk-#{version.before_comma}-osx-arm64.pkg"
        sha256 "ac440601e3bef9bf824958df5288e44e5e9e0e32f3b6fd7ecb2022f29a7a5dcb"
        pkg "dotnet-sdk-6.0.414-osx-arm64.pkg"
    end

    name ".NET SDK 6.0.414,6.0.22"
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
