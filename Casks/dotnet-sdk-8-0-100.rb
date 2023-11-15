cask "dotnet-sdk-8-0-100" do
    version "8.0.100,8.0.0"
    
    if Hardware::CPU.intel?
        url "https://download.visualstudio.microsoft.com/download/pr/27a7ece8-f6cd-4cab-89cf-987e85ae6805/2c9ab2cb294143b0533f005640c393da/dotnet-sdk-#{version.before_comma}-osx-x64.pkg"
        sha256 "67c3437cd5910e8ac1b0cc93e6d999ff237fe85b57f3e08753920a1a6ab30fde"
        pkg "dotnet-sdk-8.0.100-osx-x64.pkg"
    else
        url "https://download.visualstudio.microsoft.com/download/pr/cf196f2f-f1e2-4f9a-a7ac-546242c431e2/8c386932f4a2f96c3e95c433e4899ec2/dotnet-sdk-#{version.before_comma}-osx-arm64.pkg"
        sha256 "6cd607a4efd4565667249b98c7da2fb3f8281cd855ba7ca2de9183210395bda1"
        pkg "dotnet-sdk-8.0.100-osx-arm64.pkg"
    end

    name ".NET SDK 8.0.100,8.0.0"
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
