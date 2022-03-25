cask "dotnet-sdk-7-0-100-preview-1-22110-4" do
    version "7.0.100-preview.1.22110.4,7.0.0-preview.1"
    
    if Hardware::CPU.intel?
        url "https://download.visualstudio.microsoft.com/download/pr/d6b45e3f-1395-441d-a5ec-06b0fa380de6/5486b8caad6778dce9f2d292aa3fd3e1/dotnet-sdk-#{version.before_comma}-osx-x64.pkg"
        sha256 "3e452f80e5e8d37f8eddc146a41f5b8900d9c05c6bf2a13394feab8a1a0a2e98"
        pkg "dotnet-sdk-7.0.100-preview.1.22110.4-osx-x64.pkg"
    else
        url "https://download.visualstudio.microsoft.com/download/pr/8a5292b1-3f04-4766-8551-690c87688734/3928534aafadd1b556a1526d45d0dc8c/dotnet-sdk-#{version.before_comma}-osx-arm64.pkg"
        sha256 "e7dc99973176ae18f5e0613aba0df3a8a51ccf54dc474fb1862311f65ac75d7e"
        pkg "dotnet-sdk-7.0.100-preview.1.22110.4-osx-arm64.pkg"
    end

    name ".NET SDK 7.0.100-preview.1.22110.4,7.0.0-preview.1"
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
