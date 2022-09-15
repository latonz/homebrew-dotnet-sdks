cask "dotnet-sdk-7-0-100-rc-1-22431-12" do
    version "7.0.100-rc.1.22431.12,7.0.0-rc.1"
    
    if Hardware::CPU.intel?
        url "https://download.visualstudio.microsoft.com/download/pr/dae368f5-c03c-48b6-a7de-6dc423c3a5b7/180e601942c810f45f87fc75be783fbc/dotnet-sdk-#{version.before_comma}-osx-x64.pkg"
        sha256 "dd504b6f5cd42e331932d6e91730794622babbfcf1e897ec93de5b813a1a2339"
        pkg "dotnet-sdk-7.0.100-rc.1.22431.12-osx-x64.pkg"
    else
        url "https://download.visualstudio.microsoft.com/download/pr/a600948e-4b2b-40d2-8551-57d85492df13/196fed4c3c6c5498a0b861127353cc07/dotnet-sdk-#{version.before_comma}-osx-arm64.pkg"
        sha256 "681917e612a9cc5b623e0585bd6f0c5fedccc2c8a0c151611b0dbf2ffc9257de"
        pkg "dotnet-sdk-7.0.100-rc.1.22431.12-osx-arm64.pkg"
    end

    name ".NET SDK 7.0.100-rc.1.22431.12,7.0.0-rc.1"
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
