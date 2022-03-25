cask "dotnet-sdk-2-1-300-preview2-008533" do
    version "2.1.300-preview2-008533,2.1.0-preview2"
    
    url "https://download.microsoft.com/download/3/7/C/37C0D2E3-2056-4F9A-A67C-14DEFBD70F06/dotnet-sdk-#{version.before_comma}-osx-x64.pkg"
    sha256 "6b180f31bcb057ccdb7cda9c33ac623a63465f827a0c5e3bbe63a631880e97af"
    pkg "dotnet-sdk-2.1.300-preview2-008533-osx-x64.pkg"

    name ".NET Core SDK 2.1.300-preview2-008533,2.1.0-preview2"
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
