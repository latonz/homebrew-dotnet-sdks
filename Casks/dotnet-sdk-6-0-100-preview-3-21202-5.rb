cask "dotnet-sdk-6-0-100-preview-3-21202-5" do
    version "6.0.100-preview.3.21202.5,6.0.0-preview.3"
    
    if Hardware::CPU.intel?
        url "https://download.visualstudio.microsoft.com/download/pr/fc5fdd1f-fb4c-4b88-a507-158204030320/98497ef248883404ff5b0604dda944fb/dotnet-sdk-#{version.before_comma}-osx-x64.pkg"
        sha256 "02ccd2669e2e27dbfeb23ae526432bfab2076636440b80483edb1a6c250690f6"
        pkg "dotnet-sdk-6.0.100-preview.3.21202.5-osx-x64.pkg"
    else
        url "https://download.visualstudio.microsoft.com/download/pr/293e469c-7948-4fc9-9d10-d5d39662e19d/1ae28ceb225f19d9aa922ffa3febb872/dotnet-sdk-#{version.before_comma}-osx-arm64.pkg"
        sha256 "ccdbc6e0a75da77c1ed72975b2ae4099669454695a3396d4ba01a73525fbac38"
        pkg "dotnet-sdk-6.0.100-preview.3.21202.5-osx-arm64.pkg"
    end

    name ".NET SDK 6.0.100-preview.3.21202.5,6.0.0-preview.3"
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
