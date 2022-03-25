cask "dotnet-sdk-3-0-100" do
    version "3.0.100,3.0.0"
    
    url "https://download.visualstudio.microsoft.com/download/pr/1d39b7b6-e01f-4299-9521-7ed37602dac0/ef3031ee9605d3e7f3aa74efd444887d/dotnet-sdk-#{version.before_comma}-osx-gs-x64.pkg"
    sha256 "1a555d4daee4fb9eb17a90d14899150b6fe0f1dcfeee044ba834caf5eaca20f2"
    pkg "dotnet-sdk-3.0.100-osx-gs-x64.pkg"

    name ".NET Core SDK 3.0.100,3.0.0"
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
