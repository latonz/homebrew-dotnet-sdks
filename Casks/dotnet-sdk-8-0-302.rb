cask "dotnet-sdk-8-0-302" do
    version "8.0.302,8.0.6"
    
    if Hardware::CPU.intel?
        url "https://download.visualstudio.microsoft.com/download/pr/5b488f80-2155-4b14-9865-50f328574283/e9126ea28af0375173a18e1d8a6a3086/dotnet-sdk-#{version.before_comma}-osx-x64.pkg"
        sha256 "9ebaf4185aa0a4651ffe536db269651aa9ca7823186f490740ba165d4d5ff94f"
        pkg "dotnet-sdk-8.0.302-osx-x64.pkg"
    else
        url "https://download.visualstudio.microsoft.com/download/pr/348456db-b1d0-49ce-930d-4e905ed17efd/a39c5b23c669ed9b270e0169eea2b83b/dotnet-sdk-#{version.before_comma}-osx-arm64.pkg"
        sha256 "cb5b02c6570756988bb0c9fa426a5feff8265a8c6906cf2b385291a472ce0e54"
        pkg "dotnet-sdk-8.0.302-osx-arm64.pkg"
    end

    name ".NET SDK 8.0.302,8.0.6"
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