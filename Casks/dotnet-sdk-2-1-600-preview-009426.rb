cask "dotnet-sdk-2-1-600-preview-009426" do
    version "2.1.600-preview-009426,2.1.600-preview"
    
    url "https://download.visualstudio.microsoft.com/download/pr/1690aa3e-6039-493c-a57e-9d24f2616e96/d56658e8c3886d6d69d58e6c83ab5c22/dotnet-sdk-#{version.before_comma}-osx-gs-x64.pkg"
    sha256 "00bafc25e3dd1fdb61731d3e39e052a5db1450fce7c2525cf6e1156374fb5ca9"
    pkg "dotnet-sdk-2.1.600-preview-009426-osx-gs-x64.pkg"

    name ".NET Core SDK 2.1.600-preview-009426,2.1.600-preview"
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
