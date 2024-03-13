cask "dotnet-sdk-9-0-100-preview-2-24157-14" do
    version "9.0.100-preview.2.24157.14,9.0.0-preview.2"
    
    if Hardware::CPU.intel?
        url "https://download.visualstudio.microsoft.com/download/pr/077d24e5-df1c-40fa-8204-cd601e0b3465/44de36d04f570e120f4f47debe33b839/dotnet-sdk-#{version.before_comma}-osx-x64.pkg"
        sha256 "fe9de313fd017bf9caf5c8edf90b4837b3c3e6e8e968ef31d2e9fa0e1b97f5cb"
        pkg "dotnet-sdk-9.0.100-preview.2.24157.14-osx-x64.pkg"
    else
        url "https://download.visualstudio.microsoft.com/download/pr/ea918db8-961f-4b46-9457-00eddc6289e7/8c9b1472a0dd4d12702f598ac017617d/dotnet-sdk-#{version.before_comma}-osx-arm64.pkg"
        sha256 "2d2d5e2ae9ff425aa7a51b078e762711058b57bc449ca22aa0aaa48542e6ba1e"
        pkg "dotnet-sdk-9.0.100-preview.2.24157.14-osx-arm64.pkg"
    end

    name ".NET SDK 9.0.100-preview.2.24157.14,9.0.0-preview.2"
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