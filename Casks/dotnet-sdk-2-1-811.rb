cask "dotnet-sdk-2-1-811" do
    version "2.1.811,2.1.23"
    
    url "https://download.visualstudio.microsoft.com/download/pr/e431540d-fdb4-4504-afd9-e5ef64498ce9/5bac663ff1dc65e08dd9a5c63299e2dc/dotnet-sdk-#{version.before_comma}-osx-x64.pkg"
    sha256 "51d9f3ebe87e3fd63847d575e3adc20f4533ca51ab5dd0c43ba561f41c7d38d3"
    pkg "dotnet-sdk-2.1.811-osx-x64.pkg"

    name ".NET Core SDK 2.1.811,2.1.23"
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
