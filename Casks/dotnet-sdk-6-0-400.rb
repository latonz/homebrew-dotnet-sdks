cask "dotnet-sdk-6-0-400" do
    version "6.0.400,6.0.8"
    
    if Hardware::CPU.intel?
        url "https://download.visualstudio.microsoft.com/download/pr/2382b0d3-f865-4818-b3aa-47a94ccedba8/cd1eb0d061a1e1d8d0373603c4e82a97/dotnet-sdk-#{version.before_comma}-osx-x64.pkg"
        sha256 "c31cde7a2a0f4f63e91229d3122ae5bb7f758b0cf3093b486b0e683f6d2a62a3"
        pkg "dotnet-sdk-6.0.400-osx-x64.pkg"
    else
        url "https://download.visualstudio.microsoft.com/download/pr/a92daceb-cf41-4c37-8e70-8a158889a9b2/c027605fb8d8b51ee0892e10ed874ab8/dotnet-sdk-#{version.before_comma}-osx-arm64.pkg"
        sha256 "adb224aa775120fdaf88b48a890466853e8a8a0719c9de0199d79451b41ba7d3"
        pkg "dotnet-sdk-6.0.400-osx-arm64.pkg"
    end

    name ".NET SDK 6.0.400,6.0.8"
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
