cask "dotnet-sdk-5-0-100-preview-5-20279-10" do
    version "5.0.100-preview.5.20279.10,5.0.0-preview.5"
    
    url "https://download.visualstudio.microsoft.com/download/pr/f63b5b1e-25f9-4213-a147-ca8a252b8e27/094a39437dfc8f03eda852b36b499115/dotnet-sdk-#{version.before_comma}-osx-x64.pkg"
    sha256 "083f6853ffa3bc72c985ddfc6f4f0063fb3f169c5fa53f8b96010d8cc4251215"
    pkg "dotnet-sdk-5.0.100-preview.5.20279.10-osx-x64.pkg"

    name ".NET SDK 5.0.100-preview.5.20279.10,5.0.0-preview.5"
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
