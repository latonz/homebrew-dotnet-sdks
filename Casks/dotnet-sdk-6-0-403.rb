cask "dotnet-sdk-6-0-403" do
    version "6.0.403,6.0.11"
    
    if Hardware::CPU.intel?
        url "https://download.visualstudio.microsoft.com/download/pr/bc5cc4ae-e1e8-43fb-9471-cf6469f8db98/0033246d9e1bbc9af3952d602af68c50/dotnet-sdk-#{version.before_comma}-osx-x64.pkg"
        sha256 "71b9435f38d2e85affebb4177bd218f2f1ffd648fc6df22470fa93cc574f9b40"
        pkg "dotnet-sdk-6.0.403-osx-x64.pkg"
    else
        url "https://download.visualstudio.microsoft.com/download/pr/1d1846e3-8e51-4b83-83b5-2d00c384a8ed/62a4a23c59d97114a2156fe1736ee975/dotnet-sdk-#{version.before_comma}-osx-arm64.pkg"
        sha256 "f8a1073be3ae03af2ae73b6ba18cc3b81ef7072af3a500463be5a67ad7ce5171"
        pkg "dotnet-sdk-6.0.403-osx-arm64.pkg"
    end

    name ".NET SDK 6.0.403,6.0.11"
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
