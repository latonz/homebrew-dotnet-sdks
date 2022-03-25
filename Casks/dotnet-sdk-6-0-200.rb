cask "dotnet-sdk-6-0-200" do
    version "6.0.200,6.0.2"
    
    if Hardware::CPU.intel?
        url "https://download.visualstudio.microsoft.com/download/pr/0f1f23eb-004f-41a2-a4ef-e1a9b533a794/f2d47f0ed6a7be2027166ea1132cc806/dotnet-sdk-#{version.before_comma}-osx-x64.pkg"
        sha256 "10e3df96b7dcb750dab7a07dee1c3db4cf7bf15deefd983abda372370d3c6356"
        pkg "dotnet-sdk-6.0.200-osx-x64.pkg"
    else
        url "https://download.visualstudio.microsoft.com/download/pr/ba037891-7f55-4f23-9997-92c1b642117b/a643faacd4700bb4565eb83fb11b3293/dotnet-sdk-#{version.before_comma}-osx-arm64.pkg"
        sha256 "4211585bcb8cd9c7ad2e2a0d5388f26d2585ca9139e87d142bc2ba535c600986"
        pkg "dotnet-sdk-6.0.200-osx-arm64.pkg"
    end

    name ".NET SDK 6.0.200,6.0.2"
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
