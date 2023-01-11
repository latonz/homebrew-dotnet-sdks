cask "dotnet-sdk-6-0-405" do
    version "6.0.405,6.0.13"
    
    if Hardware::CPU.intel?
        url "https://download.visualstudio.microsoft.com/download/pr/8a0c7611-7ca1-49d7-a889-e6514fc29dd0/08927286063140ccdf88eafe0e3bd2fb/dotnet-sdk-#{version.before_comma}-osx-x64.pkg"
        sha256 "d3bebc30a42235b8999e010b3229f47fa558451d7892581bf94af40995559cbf"
        pkg "dotnet-sdk-6.0.405-osx-x64.pkg"
    else
        url "https://download.visualstudio.microsoft.com/download/pr/ee832565-1555-453e-8efc-5ea49e2e68d1/57de20cb37dedd138921ec4ea6c6c882/dotnet-sdk-#{version.before_comma}-osx-arm64.pkg"
        sha256 "ee67a3b43769b4c23394c996b2e28dab4c74dc6af3150041416fd28de4c9a933"
        pkg "dotnet-sdk-6.0.405-osx-arm64.pkg"
    end

    name ".NET SDK 6.0.405,6.0.13"
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
