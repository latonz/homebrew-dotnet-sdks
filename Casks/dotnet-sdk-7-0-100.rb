cask "dotnet-sdk-7-0-100" do
    version "7.0.100,7.0.0"
    
    if Hardware::CPU.intel?
        url "https://download.visualstudio.microsoft.com/download/pr/11810c49-a615-40ec-b869-2eb2eae30f7b/4b0b7700fa0e8307b5f99c1d372d95bb/dotnet-sdk-#{version.before_comma}-osx-x64.pkg"
        sha256 "3311f8b5bf78cd8cbf2350a4385708ce3ac111333760835bb93dab98c5867b00"
        pkg "dotnet-sdk-7.0.100-osx-x64.pkg"
    else
        url "https://download.visualstudio.microsoft.com/download/pr/4f0bd204-39be-492a-be5e-4bda7f569963/b245763ad54175dd87e260e394ec9c0d/dotnet-sdk-#{version.before_comma}-osx-arm64.pkg"
        sha256 "9ea8807a2bd7db29bbad7a3ba235bffe0999bea4fd2b4deec9e71da8da309d17"
        pkg "dotnet-sdk-7.0.100-osx-arm64.pkg"
    end

    name ".NET SDK 7.0.100,7.0.0"
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
