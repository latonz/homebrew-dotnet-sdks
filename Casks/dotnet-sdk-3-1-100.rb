cask "dotnet-sdk-3-1-100" do
    version "3.1.100,3.1.0"
    
    url "https://download.visualstudio.microsoft.com/download/pr/74af2107-4511-4acb-bcc9-ce771f53cf94/bfa74497df0516a76be07931ea1ddcd2/dotnet-sdk-#{version.before_comma}-osx-gs-x64.pkg"
    sha256 "ca7fda25207d288aa72a8f646b2c03002915f2c685b11b3e3c3a126534990e2d"
    pkg "dotnet-sdk-3.1.100-osx-gs-x64.pkg"

    name ".NET Core SDK 3.1.100,3.1.0"
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
