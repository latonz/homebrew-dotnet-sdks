cask "dotnet-sdk-6-0-301" do
    version "6.0.301,6.0.6"
    
    if Hardware::CPU.intel?
        url "https://download.visualstudio.microsoft.com/download/pr/ee524e48-da60-4da3-bbde-a253c0f55f98/5190a50cc72112aa935c4a8d4d979c24/dotnet-sdk-#{version.before_comma}-osx-x64.pkg"
        sha256 "c5ea940a28b0cc77fb6a0b5c8d1e1addcfbf91ed8df719bda0ff511a8a57c478"
        pkg "dotnet-sdk-6.0.301-osx-x64.pkg"
    else
        url "https://download.visualstudio.microsoft.com/download/pr/635bd87f-f656-4c6b-b246-44b4ea377e0b/08efab409fd319fa1752d65c809783f8/dotnet-sdk-#{version.before_comma}-osx-arm64.pkg"
        sha256 "8f17aa0d59cdcc41613857e343353546bd5d6857fd10334db920b6ccff6c27dc"
        pkg "dotnet-sdk-6.0.301-osx-arm64.pkg"
    end

    name ".NET SDK 6.0.301,6.0.6"
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
