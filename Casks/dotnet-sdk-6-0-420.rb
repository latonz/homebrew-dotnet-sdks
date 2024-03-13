cask "dotnet-sdk-6-0-420" do
    version "6.0.420,6.0.28"
    
    if Hardware::CPU.intel?
        url "https://download.visualstudio.microsoft.com/download/pr/0e01a0d5-70de-4872-9e17-ac810a2d0325/b1cdf50516e6a6fc9e413164e93a5934/dotnet-sdk-#{version.before_comma}-osx-x64.pkg"
        sha256 "ba02db1e7e608d6043d226df75730f3d23ce6b6b8a3599675ae4629726fad8ae"
        pkg "dotnet-sdk-6.0.420-osx-x64.pkg"
    else
        url "https://download.visualstudio.microsoft.com/download/pr/765a8b03-083e-4ae0-a468-3025f7025d8c/6d90637617f28810ec3abe148a051d3f/dotnet-sdk-#{version.before_comma}-osx-arm64.pkg"
        sha256 "b0d3f4fe83dd47fadabbf6eeb6175f3b52b127f4dd474e90e3d006bf3d17b127"
        pkg "dotnet-sdk-6.0.420-osx-arm64.pkg"
    end

    name ".NET SDK 6.0.420,6.0.28"
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