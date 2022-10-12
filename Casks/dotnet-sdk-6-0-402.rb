cask "dotnet-sdk-6-0-402" do
    version "6.0.402,6.0.10"
    
    if Hardware::CPU.intel?
        url "https://download.visualstudio.microsoft.com/download/pr/f55a179b-7084-41b9-98e3-408a3c317158/5445f9e747fa29ce0be3240017d28322/dotnet-sdk-#{version.before_comma}-osx-x64.pkg"
        sha256 "54b1996c0879e9ea2c7490cd49e4f51de4c5f97c8c3c1535005e1efcf0bfc90c"
        pkg "dotnet-sdk-6.0.402-osx-x64.pkg"
    else
        url "https://download.visualstudio.microsoft.com/download/pr/1816a0af-0621-4608-b21a-9852ce83d788/04675dad54b50d6778db98f226f1b944/dotnet-sdk-#{version.before_comma}-osx-arm64.pkg"
        sha256 "43890a8fb8e9b0426b5cf0cac4e1954bc231c6e4c9dcde35e1ec12f93e900925"
        pkg "dotnet-sdk-6.0.402-osx-arm64.pkg"
    end

    name ".NET SDK 6.0.402,6.0.10"
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
