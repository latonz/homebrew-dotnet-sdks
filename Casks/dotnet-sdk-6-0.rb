cask "dotnet-sdk-6-0" do
    version "6.0.201,6.0.3"
    
    if Hardware::CPU.intel?
        url "https://download.visualstudio.microsoft.com/download/pr/a5e0f5da-6088-451c-a341-b751c0d418c7/9fe3a31273888fe23cbe71cac32fa35c/dotnet-sdk-#{version.before_comma}-osx-x64.pkg"
        sha256 "a6199cee00bb381b00847cf2e4e7a2192935e2a03c8892a3368a5b3479f3868f"
        pkg "dotnet-sdk-6.0.201-osx-x64.pkg"
    else
        url "https://download.visualstudio.microsoft.com/download/pr/2e20d654-1371-4c8f-a0dd-e81bac07549e/7b63667ab1941110bf9e684dc66b590d/dotnet-sdk-#{version.before_comma}-osx-arm64.pkg"
        sha256 "a219339edb3156c84bfc684efc5a1061d528b2e10b870763bb1119f925249135"
        pkg "dotnet-sdk-6.0.201-osx-arm64.pkg"
    end

    name ".NET SDK 6.0.201,6.0.3"
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
