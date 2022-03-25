cask "dotnet-sdk-1-1-11" do
    version "1.1.11,1.1.10"
    
    url "https://download.visualstudio.microsoft.com/download/pr/3c23a7aa-eecd-461b-ad45-979c4c684917/1b464bd34c763e664f7eed6006889d87/dotnet-dev-osx-x64.#{version.before_comma}.pkg"
    sha256 "eceb1822c11c620fe26f9455f716093658f4a34dcb1b2e01e015eb28f365f6e9"
    pkg "dotnet-dev-osx-x64.1.1.11.pkg"

    name ".NET Core SDK 1.1.11,1.1.10"
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
