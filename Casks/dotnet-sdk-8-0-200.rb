cask "dotnet-sdk-8-0-200" do
    version "8.0.200,8.0.2"
    
    if Hardware::CPU.intel?
        url "https://download.visualstudio.microsoft.com/download/pr/f1e3adeb-edfd-4429-a9bf-e4c790788e2f/1d57d12283ee0086d5652f9ccc2218c7/dotnet-sdk-#{version.before_comma}-osx-x64.pkg"
        sha256 "bc431f95a41dd398b0498751d51f67cbcd36cf4c27d5715a1407c1691d98e952"
        pkg "dotnet-sdk-8.0.200-osx-x64.pkg"
    else
        url "https://download.visualstudio.microsoft.com/download/pr/87f99dbc-f7aa-4247-b40b-b1206093c33f/86625a11ac2b702bbc5aa49f529ea8da/dotnet-sdk-#{version.before_comma}-osx-arm64.pkg"
        sha256 "6e789bfccc41c92c9ee29728d78fbb5d3e95225350fd8e017cefa05c17c4d8d7"
        pkg "dotnet-sdk-8.0.200-osx-arm64.pkg"
    end

    name ".NET SDK 8.0.200,8.0.2"
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
