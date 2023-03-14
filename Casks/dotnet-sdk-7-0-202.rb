cask "dotnet-sdk-7-0-202" do
    version "7.0.202,7.0.4"
    
    if Hardware::CPU.intel?
        url "https://download.visualstudio.microsoft.com/download/pr/a87236b2-9ddd-4f48-ac81-d8d07a7cdac2/91a91d1eac4d598a6eaf5faf148f3afd/dotnet-sdk-#{version.before_comma}-osx-x64.pkg"
        sha256 "31e48e3bddddd7e30f839b949608c80994dd6172e4fd025f2789c31a48d93f5b"
        pkg "dotnet-sdk-7.0.202-osx-x64.pkg"
    else
        url "https://download.visualstudio.microsoft.com/download/pr/d569fc95-64b5-4fc3-ae06-5d3bec40e540/7532a322362c4717fc57211eafe5002c/dotnet-sdk-#{version.before_comma}-osx-arm64.pkg"
        sha256 "48a45898dc3e3a92f91f9e10c7d17a657e55399669e4cdf1917f1649c2338444"
        pkg "dotnet-sdk-7.0.202-osx-arm64.pkg"
    end

    name ".NET SDK 7.0.202,7.0.4"
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
