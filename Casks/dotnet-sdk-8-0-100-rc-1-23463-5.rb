cask "dotnet-sdk-8-0-100-rc-1-23463-5" do
    version "8.0.100-rc.1.23463.5,8.0.0-rc.1"
    
    if Hardware::CPU.intel?
        url "https://download.visualstudio.microsoft.com/download/pr/a1c8239d-f1fd-4b47-be6b-e07217068e46/78337c7ab38ad4cf0f4ed2db5f7ebe66/dotnet-sdk-#{version.before_comma}-osx-x64.pkg"
        sha256 "29d9f6b0263f7df03f5d3d37e54345bd8cb89ad711a7dba32e691f86af8d62c7"
        pkg "dotnet-sdk-8.0.100-rc.1.23463.5-osx-x64.pkg"
    else
        url "https://download.visualstudio.microsoft.com/download/pr/030ab62d-61c2-4f8f-bcec-ee45837f7df0/f69ba0e33588a4fa6a41e7b56cd52654/dotnet-sdk-#{version.before_comma}-osx-arm64.pkg"
        sha256 "f30cc0fd0ab9a3864c05befaf0d5b58bbe4169c15c5b3e35a14ce3e684d01e79"
        pkg "dotnet-sdk-8.0.100-rc.1.23463.5-osx-arm64.pkg"
    end

    name ".NET SDK 8.0.100-rc.1.23463.5,8.0.0-rc.1"
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