cask "dotnet-sdk-6-0-401" do
    version "6.0.401,6.0.9"
    
    if Hardware::CPU.intel?
        url "https://download.visualstudio.microsoft.com/download/pr/c98d3ccf-561c-4f9b-a1d7-5debb0880031/fd1ebfbd783788649ee139c229cd48fa/dotnet-sdk-#{version.before_comma}-osx-x64.pkg"
        sha256 "667920bf202c420d57091f24b8051bad8ed174e131c4c15f45f79b2a785c3744"
        pkg "dotnet-sdk-6.0.401-osx-x64.pkg"
    else
        url "https://download.visualstudio.microsoft.com/download/pr/1011a115-ca23-4bad-8632-f9a96e47d0f0/164a08cde051b61a1669d2242770ef25/dotnet-sdk-#{version.before_comma}-osx-arm64.pkg"
        sha256 "74898e91854bf89fd06a47efabc7fbc275ac2e80d7ed44beb6d6d20db39017ac"
        pkg "dotnet-sdk-6.0.401-osx-arm64.pkg"
    end

    name ".NET SDK 6.0.401,6.0.9"
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
