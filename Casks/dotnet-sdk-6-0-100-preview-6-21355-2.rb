cask "dotnet-sdk-6-0-100-preview-6-21355-2" do
    version "6.0.100-preview.6.21355.2,6.0.0-preview.6"
    
    if Hardware::CPU.intel?
        url "https://download.visualstudio.microsoft.com/download/pr/767abef9-9636-47a7-9929-6ac4201b6837/95c3c13e937efb01255843a6d4adf9ed/dotnet-sdk-#{version.before_comma}-osx-x64.pkg"
        sha256 "010cda57c1f86d06ea7fd2e1a56da6f7274bda467d90e724b715cf773568be50"
        pkg "dotnet-sdk-6.0.100-preview.6.21355.2-osx-x64.pkg"
    else
        url "https://download.visualstudio.microsoft.com/download/pr/10bb818e-3d14-435c-a76b-40da0a8c561a/616dd2f1d72c8725270530bf67907068/dotnet-sdk-#{version.before_comma}-osx-arm64.pkg"
        sha256 "7aab865fa61736ee973cd67bf9d220d88c33039f832b07659a27cb282d2ddff7"
        pkg "dotnet-sdk-6.0.100-preview.6.21355.2-osx-arm64.pkg"
    end

    name ".NET SDK 6.0.100-preview.6.21355.2,6.0.0-preview.6"
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
