cask "dotnet-sdk-6-0-416" do
    version "6.0.416,6.0.24"
    
    if Hardware::CPU.intel?
        url "https://download.visualstudio.microsoft.com/download/pr/3b305e51-67fb-47cf-a916-700e62148324/1b71cd10822a3a1805008e212157a178/dotnet-sdk-#{version.before_comma}-osx-x64.pkg"
        sha256 "a4853054795fa25b81e04f339750ab9092dbf4ae0d38103eba8b1506c109527e"
        pkg "dotnet-sdk-6.0.416-osx-x64.pkg"
    else
        url "https://download.visualstudio.microsoft.com/download/pr/94bf06c0-dcb8-45e6-bbce-c1a96f958e16/bd16f41a64771021877b52dccbba0161/dotnet-sdk-#{version.before_comma}-osx-arm64.pkg"
        sha256 "3b905b5bc80b8ec94479cb5954b829e92ca0b67bc3f99653fbaddc8598a3131e"
        pkg "dotnet-sdk-6.0.416-osx-arm64.pkg"
    end

    name ".NET SDK 6.0.416,6.0.24"
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
