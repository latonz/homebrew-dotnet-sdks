cask "dotnet-sdk-7-0-201" do
    version "7.0.201,7.0.3"
    
    if Hardware::CPU.intel?
        url "https://download.visualstudio.microsoft.com/download/pr/225948f7-3889-4bdf-9cf4-184e81216700/be35fbca24493ffbe0062c2f798e4461/dotnet-sdk-#{version.before_comma}-osx-x64.pkg"
        sha256 "146f3ec4b682f0e3b1c9d1a0bc989d7998a6a26ec62e617d636669c59cd2f81e"
        pkg "dotnet-sdk-7.0.201-osx-x64.pkg"
    else
        url "https://download.visualstudio.microsoft.com/download/pr/86bb5988-5fb5-4e22-8f21-de5992e1a689/f8f616f84dc38100a8464c4644a371ce/dotnet-sdk-#{version.before_comma}-osx-arm64.pkg"
        sha256 "2d26783103c65b311d71bed82c67c62c93c158be95c2f2ac967ec8cd3dbcc34c"
        pkg "dotnet-sdk-7.0.201-osx-arm64.pkg"
    end

    name ".NET SDK 7.0.201,7.0.3"
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
