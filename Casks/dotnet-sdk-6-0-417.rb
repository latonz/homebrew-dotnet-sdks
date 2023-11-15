cask "dotnet-sdk-6-0-417" do
    version "6.0.417,6.0.25"
    
    if Hardware::CPU.intel?
        url "https://download.visualstudio.microsoft.com/download/pr/c5479676-0268-4f47-84bb-10fdf00b8baf/f74ac823e3bcb54beed5a0fb4a5813d2/dotnet-sdk-#{version.before_comma}-osx-x64.pkg"
        sha256 "4229ff673ed6fedaa7d3acf7fe61a2cafb1514848941a4205a4dbdab03a56b57"
        pkg "dotnet-sdk-6.0.417-osx-x64.pkg"
    else
        url "https://download.visualstudio.microsoft.com/download/pr/47808287-f432-4d37-8ca3-d7aca6b12e8b/9ae7559421a9c44ba334e996701f6b8a/dotnet-sdk-#{version.before_comma}-osx-arm64.pkg"
        sha256 "6a1841a185c3b49f469fb647b55677888fe4c0eac2d8f0e1c83b5841125bdbb4"
        pkg "dotnet-sdk-6.0.417-osx-arm64.pkg"
    end

    name ".NET SDK 6.0.417,6.0.25"
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
