cask "dotnet-sdk-7-0-407" do
    version "7.0.407,7.0.17"
    
    if Hardware::CPU.intel?
        url "https://download.visualstudio.microsoft.com/download/pr/76919cab-fb8f-4726-b4cc-6c711dd99eb2/f64d22a2adf0426490bd22507bcef35d/dotnet-sdk-#{version.before_comma}-osx-x64.pkg"
        sha256 "871495b45d4117f22570c6f31c0469eb64d0b7f47a3ef27c79964cf1f9214836"
        pkg "dotnet-sdk-7.0.407-osx-x64.pkg"
    else
        url "https://download.visualstudio.microsoft.com/download/pr/64222b05-2138-42c3-b101-08c814b2f6e3/49781e5316479099a9441c4506cd1e5f/dotnet-sdk-#{version.before_comma}-osx-arm64.pkg"
        sha256 "3eb3f4775a5027d1ff43a107d103607384711ba80ffaf8eb0864141810a5601e"
        pkg "dotnet-sdk-7.0.407-osx-arm64.pkg"
    end

    name ".NET SDK 7.0.407,7.0.17"
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