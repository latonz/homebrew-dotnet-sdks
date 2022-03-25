cask "dotnet-sdk-5-0-403" do
    version "5.0.403,5.0.12"
    
    url "https://download.visualstudio.microsoft.com/download/pr/e33ad12e-b121-4205-934a-bb5fff892d1c/41598bac64f46f1e7a772867aaed638e/dotnet-sdk-#{version.before_comma}-osx-x64.pkg"
    sha256 "c36eecd7751d890864807241feb24d27622bc4330a8458d26ea9eec9766aac2f"
    pkg "dotnet-sdk-5.0.403-osx-x64.pkg"

    name ".NET SDK 5.0.403,5.0.12"
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

    zap trash: ["~/.dotnet", "~/.nuget"]
end
