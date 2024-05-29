cask "dotnet-sdk-8-0-301" do
    version "8.0.301,8.0.6"
    
    if Hardware::CPU.intel?
        url "https://download.visualstudio.microsoft.com/download/pr/825222be-354e-452e-ae45-f116d86ee0d3/c4ac600bb62a44265d54b8de48c1b273/dotnet-sdk-#{version.before_comma}-osx-x64.pkg"
        sha256 "cbaf85ab99b2d4c430343ca9116abf823abcd92aeb0578f19b927fc2f376552b"
        pkg "dotnet-sdk-8.0.301-osx-x64.pkg"
    else
        url "https://download.visualstudio.microsoft.com/download/pr/b07f0bc8-ce20-45e5-879a-a931beae3ca5/67426313b0bb8bc63ded3aeacaedca5e/dotnet-sdk-#{version.before_comma}-osx-arm64.pkg"
        sha256 "5b70f6c13ef1d58eb2ea1ef5725ee56f01f3beec0f898fd6dd4ab52f1378f77a"
        pkg "dotnet-sdk-8.0.301-osx-arm64.pkg"
    end

    name ".NET SDK 8.0.301,8.0.6"
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