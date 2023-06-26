cask "dotnet-sdk-6-0-411" do
    version "6.0.411,6.0.19"
    
    if Hardware::CPU.intel?
        url "https://download.visualstudio.microsoft.com/download/pr/a91e812a-f286-4b1b-b050-f9612c4f5ec9/dd24f826e0c99945066987df1f7ec790/dotnet-sdk-#{version.before_comma}-osx-x64.pkg"
        sha256 "fe4ee80a4c823eb30ea75f37392dd1fa3423ee42eba09af3680eec747e54d8f5"
        pkg "dotnet-sdk-6.0.411-osx-x64.pkg"
    else
        url "https://download.visualstudio.microsoft.com/download/pr/1b86cb38-768d-47af-a9c0-7bc78e1cae84/d45528a6916f85bfcde29d2794139087/dotnet-sdk-#{version.before_comma}-osx-arm64.pkg"
        sha256 "a0e8a5aeb3e65e3a6609e0108d17e29df8e8106de51b593d66744f81c9de0b05"
        pkg "dotnet-sdk-6.0.411-osx-arm64.pkg"
    end

    name ".NET SDK 6.0.411,6.0.19"
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
