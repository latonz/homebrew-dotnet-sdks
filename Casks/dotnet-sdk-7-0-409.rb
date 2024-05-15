cask "dotnet-sdk-7-0-409" do
    version "7.0.409,7.0.19"
    
    if Hardware::CPU.intel?
        url "https://download.visualstudio.microsoft.com/download/pr/57b23969-984e-4af7-a626-14e88c855e3f/03bca992dbd39408313f8f38152d602b/dotnet-sdk-#{version.before_comma}-osx-x64.pkg"
        sha256 "bebaf3d3a8b8698e559b979853c33a005875edd1160fc52885bd87acb2dd182a"
        pkg "dotnet-sdk-7.0.409-osx-x64.pkg"
    else
        url "https://download.visualstudio.microsoft.com/download/pr/6255162b-0302-49b3-9a38-2d3dec15547a/8f4bbdb4230583c802875dd763418209/dotnet-sdk-#{version.before_comma}-osx-arm64.pkg"
        sha256 "a6ab56a188871e29129d1c55e7362d921304e275ecd7275304a85798b3fa304d"
        pkg "dotnet-sdk-7.0.409-osx-arm64.pkg"
    end

    name ".NET SDK 7.0.409,7.0.19"
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