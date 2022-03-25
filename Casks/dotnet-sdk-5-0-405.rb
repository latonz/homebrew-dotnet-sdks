cask "dotnet-sdk-5-0-405" do
    version "5.0.405,5.0.14"
    
    url "https://download.visualstudio.microsoft.com/download/pr/77ad3bf2-2229-44a0-a5d2-56d476bc9b90/a6356813f1e5934c1dff6f0391c5b826/dotnet-sdk-#{version.before_comma}-osx-x64.pkg"
    sha256 "96f2f1f658a413e53088d8ed4d47e9090073d15b0682519802b954437d5026b3"
    pkg "dotnet-sdk-5.0.405-osx-x64.pkg"

    name ".NET SDK 5.0.405,5.0.14"
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
