cask "dotnet-sdk-3-0-100-preview4-011223" do
    version "3.0.100-preview4-011223,3.0.0-preview4"
    
    url "https://download.visualstudio.microsoft.com/download/pr/76e25984-7108-4fb8-8aed-556199384b4a/e010fe0a188dabb738c9957dda6bea0e/dotnet-sdk-#{version.before_comma}-osx-gs-x64.pkg"
    sha256 "1ae6d3236d87fb3cd3d0e3c3431b07215154478b430dd32f3c1a759ae0f16867"
    pkg "dotnet-sdk-3.0.100-preview4-011223-osx-gs-x64.pkg"

    name ".NET Core SDK 3.0.100-preview4-011223,3.0.0-preview4"
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
