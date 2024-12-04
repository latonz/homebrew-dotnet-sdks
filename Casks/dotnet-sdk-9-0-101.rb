cask "dotnet-sdk-9-0-101" do
    version "9.0.101,9.0.0"
    
    if Hardware::CPU.intel?
        url "https://download.visualstudio.microsoft.com/download/pr/1fec6f64-0d7f-4b39-acd1-e9e2701a6b1d/b7b6246d0c20cfe703c6c88ffdbb081e/dotnet-sdk-#{version.before_comma}-osx-x64.pkg"
        sha256 "4ca38ac2882cae8f69d686a9442bf89232fe9808654f68ad0f72e13d72741787"
        pkg "dotnet-sdk-9.0.101-osx-x64.pkg"
    else
        url "https://download.visualstudio.microsoft.com/download/pr/00630dd1-1470-4f65-9238-a9262d170a29/86e0e51d908e9b12b017423c2f915998/dotnet-sdk-#{version.before_comma}-osx-arm64.pkg"
        sha256 "8ba374f99e79ca0bcf9312e803ea1f8888e963830b0a3786758f2fe9e34ddf5c"
        pkg "dotnet-sdk-9.0.101-osx-arm64.pkg"
    end

    name ".NET SDK 9.0.101,9.0.0"
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