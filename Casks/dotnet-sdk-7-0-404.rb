cask "dotnet-sdk-7-0-404" do
    version "7.0.404,7.0.14"
    
    if Hardware::CPU.intel?
        url "https://download.visualstudio.microsoft.com/download/pr/81b6b736-1218-4bb0-9100-89945de897be/a2be9ad05a16c0b39c02f2328ccdc6b4/dotnet-sdk-#{version.before_comma}-osx-x64.pkg"
        sha256 "e374bc81d680193d9ce37a79e544325d5ad5944d6dff51037148e4437e8362f5"
        pkg "dotnet-sdk-7.0.404-osx-x64.pkg"
    else
        url "https://download.visualstudio.microsoft.com/download/pr/bc914058-c08a-44a2-a581-5c9807143b55/ddb7f2330a4250f28b15e1329bc11fa9/dotnet-sdk-#{version.before_comma}-osx-arm64.pkg"
        sha256 "8cd0c91195fc90ce83ade8b3fd6f8aabae77ee35deeb8820d1b94b802942a45b"
        pkg "dotnet-sdk-7.0.404-osx-arm64.pkg"
    end

    name ".NET SDK 7.0.404,7.0.14"
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
