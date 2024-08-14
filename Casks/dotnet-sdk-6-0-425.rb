cask "dotnet-sdk-6-0-425" do
    version "6.0.425,6.0.33"
    
    if Hardware::CPU.intel?
        url "https://download.visualstudio.microsoft.com/download/pr/8010eb35-b580-4fe3-84a1-323aef5d6947/cd513767c7ece93a71c69703169dd1c5/dotnet-sdk-#{version.before_comma}-osx-x64.pkg"
        sha256 "7994b86068fdc02666947697e0e396232f154832e777940853c3c1baebb80ec3"
        pkg "dotnet-sdk-6.0.425-osx-x64.pkg"
    else
        url "https://download.visualstudio.microsoft.com/download/pr/4bb697a0-9509-4a48-aace-adf5cdd9dae5/db8114ff1a9117627a19ef3b5e709a05/dotnet-sdk-#{version.before_comma}-osx-arm64.pkg"
        sha256 "50a127ab788626387236d0a7c8ff9ad208ce506f33409a3877812cf0504d6a9b"
        pkg "dotnet-sdk-6.0.425-osx-arm64.pkg"
    end

    name ".NET SDK 6.0.425,6.0.33"
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