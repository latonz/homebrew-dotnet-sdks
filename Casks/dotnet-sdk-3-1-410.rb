cask "dotnet-sdk-3-1-410" do
    version "3.1.410,3.1.16"
    
    url "https://download.visualstudio.microsoft.com/download/pr/8dfd42ef-6ce9-4eda-bf10-592b508aefea/06d039e7a5b0292877a527464f9fc3b3/dotnet-sdk-#{version.before_comma}-osx-x64.pkg"
    sha256 "d1cb14726bbfd37c7d893e5660f2c1c8584e24e392f837862c358d65cdbd4692"
    pkg "dotnet-sdk-3.1.410-osx-x64.pkg"

    name ".NET Core SDK 3.1.410,3.1.16"
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
