cask "dotnet-sdk-3-1-422" do
    version "3.1.422,3.1.28"
    
    url "https://download.visualstudio.microsoft.com/download/pr/f0d8ea7f-2a12-46ee-9808-c018aa78e8b6/2757f0e395ac71eb09453c52fd8e1841/dotnet-sdk-#{version.before_comma}-osx-x64.pkg"
    sha256 "20a23e43cd7d2b6732c0c2b614227e0e1825d2232027d6f34e0735daaec9a7b8"
    pkg "dotnet-sdk-3.1.422-osx-x64.pkg"

    name ".NET Core SDK 3.1.422,3.1.28"
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
