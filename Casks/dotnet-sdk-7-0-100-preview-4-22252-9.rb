cask "dotnet-sdk-7-0-100-preview-4-22252-9" do
    version "7.0.100-preview.4.22252.9,7.0.0-preview.4"
    
    if Hardware::CPU.intel?
        url "https://download.visualstudio.microsoft.com/download/pr/6b26f2f0-f2d1-4ca3-a0ae-ffbd8ac31629/174bdf9b481872c7591fa576833c6c30/dotnet-sdk-#{version.before_comma}-osx-x64.pkg"
        sha256 "640107113e2ca69abe87a5dd5a3a3cbaab4bc3554d7982a26f77a76a486f3c59"
        pkg "dotnet-sdk-7.0.100-preview.4.22252.9-osx-x64.pkg"
    else
        url "https://download.visualstudio.microsoft.com/download/pr/710799ef-650d-4ecb-8ff4-bf4532fb8d55/afc8538380be4257e271212d15664ab8/dotnet-sdk-#{version.before_comma}-osx-arm64.pkg"
        sha256 "bedf3f29f60c88fdbbfd8cbec70953db925b906de894ad1df45835dcb29b5dff"
        pkg "dotnet-sdk-7.0.100-preview.4.22252.9-osx-arm64.pkg"
    end

    name ".NET SDK 7.0.100-preview.4.22252.9,7.0.0-preview.4"
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
