cask "dotnet-sdk-9-0-100-preview-5-24307-3" do
    version "9.0.100-preview.5.24307.3,9.0.0-preview.5"
    
    if Hardware::CPU.intel?
        url "https://download.visualstudio.microsoft.com/download/pr/f4139839-15fa-4ef6-a1b0-fb77ee467b2e/7529958cc121871a79d3da1a0f851333/dotnet-sdk-#{version.before_comma}-osx-x64.pkg"
        sha256 "2d9d3f027b038dbeb7ec2a4ffd15e43b979d691d9155b79d0019fdb1dfca02bd"
        pkg "dotnet-sdk-9.0.100-preview.5.24307.3-osx-x64.pkg"
    else
        url "https://download.visualstudio.microsoft.com/download/pr/4138605e-d1df-4672-b024-862b8b1bc4dc/bbf19075238cb836aa0483014f8174e3/dotnet-sdk-#{version.before_comma}-osx-arm64.pkg"
        sha256 "f42fe838b24c13587719ecbc8267d430c4361c3d71038761779ca619378c52d4"
        pkg "dotnet-sdk-9.0.100-preview.5.24307.3-osx-arm64.pkg"
    end

    name ".NET SDK 9.0.100-preview.5.24307.3,9.0.0-preview.5"
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