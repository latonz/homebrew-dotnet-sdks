cask "dotnet-sdk-6-0-100-preview-2-21155-3" do
    version "6.0.100-preview.2.21155.3,6.0.0-preview.2"
    
    if Hardware::CPU.intel?
        url "https://download.visualstudio.microsoft.com/download/pr/5e10dc75-294e-49f4-972e-218ae86191a3/e46d3533c30c8a864252a334820263a9/dotnet-sdk-#{version.before_comma}-osx-x64.pkg"
        sha256 "626c3c9beed8bf64797838ccebbc05cae5dc7cf28ebc741e444f45d7c0ed03b3"
        pkg "dotnet-sdk-6.0.100-preview.2.21155.3-osx-x64.pkg"
    else
        url "https://download.visualstudio.microsoft.com/download/pr/e5cbc909-e705-4bc1-9327-15c9f905a149/6da57e95a58cef98444698fa72378e23/dotnet-sdk-#{version.before_comma}-osx-arm64.pkg"
        sha256 "9d9c6fc1a829a40222271c8b312368195dd2a771791120b33ab5a03cebdcc843"
        pkg "dotnet-sdk-6.0.100-preview.2.21155.3-osx-arm64.pkg"
    end

    name ".NET SDK 6.0.100-preview.2.21155.3,6.0.0-preview.2"
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
