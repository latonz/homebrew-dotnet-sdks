cask "dotnet-sdk-3-1-423" do
    version "3.1.423,3.1.29"
    
    url "https://download.visualstudio.microsoft.com/download/pr/dd9e2eb6-adf9-4da5-a058-c69118fca0f9/392150c11bf427c05560690db0572193/dotnet-sdk-#{version.before_comma}-osx-x64.pkg"
    sha256 "a333e1091d89007a1b7071a051abacd83fb9981f27abfddadebf1480a0092b1f"
    pkg "dotnet-sdk-3.1.423-osx-x64.pkg"

    name ".NET Core SDK 3.1.423,3.1.29"
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
