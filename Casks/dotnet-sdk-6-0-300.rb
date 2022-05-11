cask "dotnet-sdk-6-0-300" do
    version "6.0.300,6.0.5"
    
    if Hardware::CPU.intel?
        url "https://download.visualstudio.microsoft.com/download/pr/a048efaf-c4ee-4c22-a987-2bda2a58253c/3ddde00d1b2cf420a0d870df26bc56f8/dotnet-sdk-#{version.before_comma}-osx-x64.pkg"
        sha256 "c5a9890bf2b83e8f6b307f9e8a8704d0d31c20be19ff3785978a1bb31ff788cb"
        pkg "dotnet-sdk-6.0.300-osx-x64.pkg"
    else
        url "https://download.visualstudio.microsoft.com/download/pr/9e14be2d-f676-41ca-8483-ca43bb9c2fc6/7c647915c92303c11a444f88c66f174f/dotnet-sdk-#{version.before_comma}-osx-arm64.pkg"
        sha256 "409ce62821c3ae3ae8fd800c48f7d109dfffcf11b6462dd2466a5398bd94a4df"
        pkg "dotnet-sdk-6.0.300-osx-arm64.pkg"
    end

    name ".NET SDK 6.0.300,6.0.5"
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
