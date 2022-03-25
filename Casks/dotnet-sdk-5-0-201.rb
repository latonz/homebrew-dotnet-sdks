cask "dotnet-sdk-5-0-201" do
    version "5.0.201,5.0.4"
    
    url "https://download.visualstudio.microsoft.com/download/pr/de613120-9306-4867-b504-45fcc81ba1b6/2a03f18c549f52cf78f88afa44e6dc6a/dotnet-sdk-#{version.before_comma}-osx-x64.pkg"
    sha256 "ff8914bc1cac2af0e8959a42afd2fb18517505b3118f64abd7dcc30276fe8c1d"
    pkg "dotnet-sdk-5.0.201-osx-x64.pkg"

    name ".NET SDK 5.0.201,5.0.4"
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
