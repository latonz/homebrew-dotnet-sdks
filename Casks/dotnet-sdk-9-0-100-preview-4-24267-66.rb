cask "dotnet-sdk-9-0-100-preview-4-24267-66" do
    version "9.0.100-preview.4.24267.66,9.0.0-preview.4"
    
    if Hardware::CPU.intel?
        url "https://download.visualstudio.microsoft.com/download/pr/f0858498-9230-46ee-9cf4-fb68aec0e37d/58e82c5b5705f0fd9efb2d4ecc74c02b/dotnet-sdk-#{version.before_comma}-osx-x64.pkg"
        sha256 "59a3ab1b195ef527336d42fc03578ec7973e1875d181a18e97a1cc1e8f510335"
        pkg "dotnet-sdk-9.0.100-preview.4.24267.66-osx-x64.pkg"
    else
        url "https://download.visualstudio.microsoft.com/download/pr/343689ab-65e1-4633-b85a-ca1bb8a0e5d1/e04cf1a20a665f377e2ea45d3a9734c5/dotnet-sdk-#{version.before_comma}-osx-arm64.pkg"
        sha256 "32b3d7ad3c38820321c12df07d776623cb4141fa006d2ffc6f60548d075c0f1f"
        pkg "dotnet-sdk-9.0.100-preview.4.24267.66-osx-arm64.pkg"
    end

    name ".NET SDK 9.0.100-preview.4.24267.66,9.0.0-preview.4"
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