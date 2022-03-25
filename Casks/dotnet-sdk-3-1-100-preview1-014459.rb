cask "dotnet-sdk-3-1-100-preview1-014459" do
    version "3.1.100-preview1-014459,3.1.0-preview1"
    
    url "https://download.visualstudio.microsoft.com/download/pr/e1213e6c-4632-44f0-9e0f-f1d0cfcbc66c/f1b9c7d0b0d57443b85860c34ef86ce4/dotnet-sdk-#{version.before_comma}-osx-gs-x64.pkg"
    sha256 "c155f28acbe8570457d9e0fb79f5d5428f0f9a287b08e7c55cb4e79a9a582b71"
    pkg "dotnet-sdk-3.1.100-preview1-014459-osx-gs-x64.pkg"

    name ".NET Core SDK 3.1.100-preview1-014459,3.1.0-preview1"
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
