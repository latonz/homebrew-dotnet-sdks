cask "dotnet-sdk-1-1-8" do
    version "1.1.8,1.1.7"
    
    url "https://download.microsoft.com/download/6/5/F/65F1653E-F835-4DE3-BB36-F324D3925F32/dotnet-sdk-osx-x64.#{version.before_comma}.pkg"
    sha256 "8efa929cb8d94e092efe69f40057446265db4e61f9ff588cd3b27da00c200501"
    pkg "dotnet-sdk-osx-x64.1.1.8.pkg"

    name ".NET Core SDK 1.1.8,1.1.7"
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
