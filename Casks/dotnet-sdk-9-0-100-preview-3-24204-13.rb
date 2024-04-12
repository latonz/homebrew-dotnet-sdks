cask "dotnet-sdk-9-0-100-preview-3-24204-13" do
    version "9.0.100-preview.3.24204.13,9.0.0-preview.3"
    
    if Hardware::CPU.intel?
        url "https://download.visualstudio.microsoft.com/download/pr/9794b13e-14f8-4fd8-baa9-265adc2c7f31/605ec6e450a81e1acfeedc06444450f9/dotnet-sdk-#{version.before_comma}-osx-x64.pkg"
        sha256 "bf6b12af95d2f83a50e50762902e09318fd5172c965427292d6ba8f0aaefda72"
        pkg "dotnet-sdk-9.0.100-preview.3.24204.13-osx-x64.pkg"
    else
        url "https://download.visualstudio.microsoft.com/download/pr/788839e8-1e23-4ed2-b176-534d3c4d5899/d80c58a63108090e803c06d0b05a1b73/dotnet-sdk-#{version.before_comma}-osx-arm64.pkg"
        sha256 "b00ab761376b421853ce40a35fff85497d9ba9850b751aec6b279b87dad0f96e"
        pkg "dotnet-sdk-9.0.100-preview.3.24204.13-osx-arm64.pkg"
    end

    name ".NET SDK 9.0.100-preview.3.24204.13,9.0.0-preview.3"
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