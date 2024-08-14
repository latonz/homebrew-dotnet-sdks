cask "dotnet-sdk-9-0-100-preview-7-24407-12" do
    version "9.0.100-preview.7.24407.12,9.0.0-preview.7"
    
    if Hardware::CPU.intel?
        url "https://download.visualstudio.microsoft.com/download/pr/8fe9315f-284a-400c-8e09-6f8ad474ad46/8ebb620e266c23d064f2cb7f0de1e635/dotnet-sdk-#{version.before_comma}-osx-x64.pkg"
        sha256 "2cb0f20ea2c9984f6fc0f9754aea950b95c270568cabdbba663596abcd88b917"
        pkg "dotnet-sdk-9.0.100-preview.7.24407.12-osx-x64.pkg"
    else
        url "https://download.visualstudio.microsoft.com/download/pr/1f851fbf-f9d3-4b2a-9189-a1686bcb4853/8f8c50e3186b29bfc0a65f9a0ba7c31d/dotnet-sdk-#{version.before_comma}-osx-arm64.pkg"
        sha256 "9a6c7f8613250f114a9ebc8c67903c40da7282bd8360524484f450ebcd6d50fb"
        pkg "dotnet-sdk-9.0.100-preview.7.24407.12-osx-arm64.pkg"
    end

    name ".NET SDK 9.0.100-preview.7.24407.12,9.0.0-preview.7"
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