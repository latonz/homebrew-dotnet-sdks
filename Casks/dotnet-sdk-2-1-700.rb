cask "dotnet-sdk-2-1-700" do
    version "2.1.700,2.1.700"
    
    url "https://download.visualstudio.microsoft.com/download/pr/817a7efd-8b54-4b10-9823-12a936abc51b/a1f84d87a7b253a8288a03cc00f8f81d/dotnet-sdk-#{version.before_comma}-osx-gs-x64.pkg"
    sha256 "1f4b5ab7232839ceb1b7feb52559a1b0fa7bfe5b4db3eea42f8cac3936e6ca38"
    pkg "dotnet-sdk-2.1.700-osx-gs-x64.pkg"

    name ".NET Core SDK 2.1.700,2.1.700"
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
