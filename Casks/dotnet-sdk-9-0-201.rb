cask "dotnet-sdk-9-0-201" do
    version "9.0.201,9.0.3"
    
    if Hardware::CPU.intel?
        url "https://download.visualstudio.microsoft.com/download/pr/c4538324-a899-4a99-8961-627b9448c38d/ee34a89933c2471a243feccfb225fd6f/dotnet-sdk-#{version.before_comma}-osx-x64.pkg"
        sha256 "0785efa32eff3b19a7d7649163b2db9ba0adbd80ade89eb0caceff0157d7a8e3"
        pkg "dotnet-sdk-9.0.201-osx-x64.pkg"
    else
        url "https://download.visualstudio.microsoft.com/download/pr/df799588-f7c7-4b9e-98f3-e93bf6b3a917/9779d41bff69c93a5ad52162d6547455/dotnet-sdk-#{version.before_comma}-osx-arm64.pkg"
        sha256 "1daa96e198113127e989fa80d62514f7e0aa0304c709a59e6e6b613d811174ab"
        pkg "dotnet-sdk-9.0.201-osx-arm64.pkg"
    end

    name ".NET SDK 9.0.201,9.0.3"
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