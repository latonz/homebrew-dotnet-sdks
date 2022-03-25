cask "dotnet-sdk-6-0-101" do
    version "6.0.101,6.0.1"
    
    if Hardware::CPU.intel?
        url "https://download.visualstudio.microsoft.com/download/pr/83e6b9b3-a78e-4df7-b33f-78a38a1db0c7/b1641cad9024c212bafdd6273f3d5e19/dotnet-sdk-#{version.before_comma}-osx-x64.pkg"
        sha256 "31414204e26119baf10eaa035ff1b30e98df1bd57c5d86800fd95c5a4b7caa20"
        pkg "dotnet-sdk-6.0.101-osx-x64.pkg"
    else
        url "https://download.visualstudio.microsoft.com/download/pr/43027810-8a5a-40bf-a10a-c3e8d9adef48/e11706837e6380a1760438d0787e9b72/dotnet-sdk-#{version.before_comma}-osx-arm64.pkg"
        sha256 "429a2759df7adaba9c29ca4b4d1b4c3a7dc393b5f5238ab77d90203eced0fafd"
        pkg "dotnet-sdk-6.0.101-osx-arm64.pkg"
    end

    name ".NET SDK 6.0.101,6.0.1"
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
