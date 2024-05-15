cask "dotnet-sdk-8-0-300" do
    version "8.0.300,8.0.5"
    
    if Hardware::CPU.intel?
        url "https://download.visualstudio.microsoft.com/download/pr/e7e9bfe4-8277-4b2f-946a-b49c2b910884/0a6c4853f7fec5d641087bf3ffabbd55/dotnet-sdk-#{version.before_comma}-osx-x64.pkg"
        sha256 "469066cd3c4e49684af1de4f1de62a4a714a509e3089080f257f4b5376bdefe8"
        pkg "dotnet-sdk-8.0.300-osx-x64.pkg"
    else
        url "https://download.visualstudio.microsoft.com/download/pr/9f854d0d-dbb2-4bd0-a2e9-d46d0d612be8/142646adaedce26ccc67b020b0123f42/dotnet-sdk-#{version.before_comma}-osx-arm64.pkg"
        sha256 "07fb70e011e1bfe73b225c1f507ea49d8225c6cd4d7aaed9c0d4452fd4ccdd30"
        pkg "dotnet-sdk-8.0.300-osx-arm64.pkg"
    end

    name ".NET SDK 8.0.300,8.0.5"
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