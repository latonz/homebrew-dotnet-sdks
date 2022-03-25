cask "dotnet-sdk-5-0-101" do
    version "5.0.101,5.0.1"
    
    url "https://download.visualstudio.microsoft.com/download/pr/0a7fa783-02e1-4785-b7b1-3c430f8825dc/764e53ff2f5722bc1b8bbc178fe25930/dotnet-sdk-#{version.before_comma}-osx-x64.pkg"
    sha256 "280209019adf9b90480619d2150b818a572fe4e68c3e013d29cbb20fef5bc4bc"
    pkg "dotnet-sdk-5.0.101-osx-x64.pkg"

    name ".NET SDK 5.0.101,5.0.1"
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
