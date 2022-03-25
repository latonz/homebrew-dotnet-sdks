cask "dotnet-sdk-2-1-806" do
    version "2.1.806,2.1.18"
    
    url "https://download.visualstudio.microsoft.com/download/pr/7d18ea81-1124-4a08-bc8d-cc436f48e47e/d9b45de44d764cbfa23aa8a27b779c96/dotnet-sdk-#{version.before_comma}-osx-x64.pkg"
    sha256 "a52d5fc1c51726b5a349574dde4c4a9250f312a28907cfd6ac6384fa329cebc3"
    pkg "dotnet-sdk-2.1.806-osx-x64.pkg"

    name ".NET Core SDK 2.1.806,2.1.18"
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
