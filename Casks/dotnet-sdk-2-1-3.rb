cask "dotnet-sdk-2-1-3" do
    version "2.1.3,2.0.4"
    
    url "https://download.microsoft.com/download/2/9/3/293BC432-348C-4D1C-B628-5AC8AB7FA162/dotnet-sdk-#{version.before_comma}-osx-x64.pkg"
    sha256 "589fc8292443a23ebf5711cecbe29c26cff79cadd226f9196fb14822a4a8f378"
    pkg "dotnet-sdk-2.1.3-osx-x64.pkg"

    name ".NET Core SDK 2.1.3,2.0.4"
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
