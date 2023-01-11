cask "dotnet-sdk-7-0-102" do
    version "7.0.102,7.0.2"
    
    if Hardware::CPU.intel?
        url "https://download.visualstudio.microsoft.com/download/pr/17798684-12da-417d-845b-8d2f54b3bd67/d6a67ffe06f263906571aacf7057bc8e/dotnet-sdk-#{version.before_comma}-osx-x64.pkg"
        sha256 "ed7c0621f3edf89f2a7390d7d4cc0cfe577b896b7f44d0e3669780e1bd704fc0"
        pkg "dotnet-sdk-7.0.102-osx-x64.pkg"
    else
        url "https://download.visualstudio.microsoft.com/download/pr/dfbffbab-2187-44a8-b911-308136f001c1/8c754f776f6a476f6ab6681d72d88b2e/dotnet-sdk-#{version.before_comma}-osx-arm64.pkg"
        sha256 "8fcc6de227185e4666d32a24f9109779e612dd55460ca312a66978b97680cfb1"
        pkg "dotnet-sdk-7.0.102-osx-arm64.pkg"
    end

    name ".NET SDK 7.0.102,7.0.2"
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
