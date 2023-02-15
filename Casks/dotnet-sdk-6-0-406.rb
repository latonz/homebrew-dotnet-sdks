cask "dotnet-sdk-6-0-406" do
    version "6.0.406,6.0.14"
    
    if Hardware::CPU.intel?
        url "https://download.visualstudio.microsoft.com/download/pr/85962c99-0139-47f0-aa4c-b566b809b6a1/2008bf2ed757e67f382fe92c0fcca583/dotnet-sdk-#{version.before_comma}-osx-x64.pkg"
        sha256 "75df4b691aec4d1645791643a9bd45b9aa11cc0d34b97a664e9a59bbf535e0fc"
        pkg "dotnet-sdk-6.0.406-osx-x64.pkg"
    else
        url "https://download.visualstudio.microsoft.com/download/pr/a88e8808-bb19-4722-9101-a46814aa2118/17af8da06a520d9435038768fde4d085/dotnet-sdk-#{version.before_comma}-osx-arm64.pkg"
        sha256 "7197befb07840977815e47460b3eaf1d5043f9ecbf2ce822330cd79fc66ea8d2"
        pkg "dotnet-sdk-6.0.406-osx-arm64.pkg"
    end

    name ".NET SDK 6.0.406,6.0.14"
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
