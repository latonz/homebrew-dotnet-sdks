cask "dotnet-sdk-9-0-100-preview-1-24101-2" do
    version "9.0.100-preview.1.24101.2,9.0.0-preview.1"
    
    if Hardware::CPU.intel?
        url "https://download.visualstudio.microsoft.com/download/pr/5c78b512-56ef-49a1-b181-96ca60917c06/f6ad92dac6791efabedd862a495e7d4b/dotnet-sdk-#{version.before_comma}-osx-x64.pkg"
        sha256 "70b3e7535ffaa3554d88903510445475348b582d286a78b1d0c317703d389c08"
        pkg "dotnet-sdk-9.0.100-preview.1.24101.2-osx-x64.pkg"
    else
        url "https://download.visualstudio.microsoft.com/download/pr/f3a5f6fd-0b74-407c-a3cf-52792d76415f/53c4911d66ce7a8757c9d10c2c4d6414/dotnet-sdk-#{version.before_comma}-osx-arm64.pkg"
        sha256 "29cd968609c9b4a769b069d857419f8e5422b9168638bdde3ecab36bd0e8ee9c"
        pkg "dotnet-sdk-9.0.100-preview.1.24101.2-osx-arm64.pkg"
    end

    name ".NET SDK 9.0.100-preview.1.24101.2,9.0.0-preview.1"
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
