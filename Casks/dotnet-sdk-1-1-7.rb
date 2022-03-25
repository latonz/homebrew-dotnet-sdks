cask "dotnet-sdk-1-1-7" do
    version "1.1.7,1.1.6"
    
    url "https://download.microsoft.com/download/4/E/6/4E64A465-F02E-43AD-9A86-A08A223A82C3/dotnet-dev-osx-x64.#{version.before_comma}.pkg"
    sha256 "190352005c0e8ccde97a109dc727eb88e2eaacf833e3f72bc8204d54ba017268"
    pkg "dotnet-dev-osx-x64.1.1.7.pkg"

    name ".NET Core SDK 1.1.7,1.1.6"
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
