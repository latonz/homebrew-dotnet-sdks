cask "dotnet-sdk-3-1-408" do
    version "3.1.408,3.1.14"
    
    url "https://download.visualstudio.microsoft.com/download/pr/99ff3282-3027-4bb8-8b96-8715d674f417/a483e65d765e3f475d009f233ddfec35/dotnet-sdk-#{version.before_comma}-osx-x64.pkg"
    sha256 "e0e23fd95ba69719c9cf37f981cb8a03ec0cf09d095ae7d006a7b7b926623a4a"
    pkg "dotnet-sdk-3.1.408-osx-x64.pkg"

    name ".NET Core SDK 3.1.408,3.1.14"
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
