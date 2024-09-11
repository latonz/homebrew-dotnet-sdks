cask "dotnet-sdk-9-0-100-rc-1-24452-12" do
    version "9.0.100-rc.1.24452.12,9.0.0-rc.1"
    
    if Hardware::CPU.intel?
        url "https://download.visualstudio.microsoft.com/download/pr/66064632-b4da-426d-8c92-964ef60a1705/d89d50709014f11cd6dd6118d0fe653f/dotnet-sdk-#{version.before_comma}-osx-x64.pkg"
        sha256 "78c4b615758a1ea8c7e92d97af107c8835afaf3bb2ee6beeff47bf7c0608cced"
        pkg "dotnet-sdk-9.0.100-rc.1.24452.12-osx-x64.pkg"
    else
        url "https://download.visualstudio.microsoft.com/download/pr/556d3bd1-88f9-4193-899e-3253b3f1cb6e/81869aaa34551cd754dce5d2b7907a7f/dotnet-sdk-#{version.before_comma}-osx-arm64.pkg"
        sha256 "bba065df3b51fe8522e147231620c902f17c661e1f9dd22319ea8daaef4720fe"
        pkg "dotnet-sdk-9.0.100-rc.1.24452.12-osx-arm64.pkg"
    end

    name ".NET SDK 9.0.100-rc.1.24452.12,9.0.0-rc.1"
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