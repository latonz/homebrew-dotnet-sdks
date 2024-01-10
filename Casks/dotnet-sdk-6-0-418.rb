cask "dotnet-sdk-6-0-418" do
    version "6.0.418,6.0.26"
    
    if Hardware::CPU.intel?
        url "https://download.visualstudio.microsoft.com/download/pr/ba81dbfc-1340-403a-b5c0-4fb36702e9d7/b001ed59b2abe972a5cb9238f2a873b1/dotnet-sdk-#{version.before_comma}-osx-x64.pkg"
        sha256 "651b9431931dee2e183a61543c7f4cd6a89b3fd9a5c0590f2d936922e53ffbdc"
        pkg "dotnet-sdk-6.0.418-osx-x64.pkg"
    else
        url "https://download.visualstudio.microsoft.com/download/pr/40173cfc-efa9-47e4-83d9-806839c7be01/4242d0be35aec95d7c1e395520edbf38/dotnet-sdk-#{version.before_comma}-osx-arm64.pkg"
        sha256 "7a3a53607877b27aa21f1fc2221d9695585fa76c995edf8d5633b0c5b6f9b997"
        pkg "dotnet-sdk-6.0.418-osx-arm64.pkg"
    end

    name ".NET SDK 6.0.418,6.0.26"
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
