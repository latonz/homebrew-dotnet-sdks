cask "dotnet-sdk-6-0-100-rc-1-21463-6" do
    version "6.0.100-rc.1.21463.6,6.0.0-rc.1"
    
    if Hardware::CPU.intel?
        url "https://download.visualstudio.microsoft.com/download/pr/4ca60318-1905-4b5a-90ad-060bc5357857/a129beb791b78a034e5e6453273dcd84/dotnet-sdk-#{version.before_comma}-osx-x64.pkg"
        sha256 "eca46d6b5d3249bf25e787651f67e642eb46e5ce554fd4e0c73058fd383faa3d"
        pkg "dotnet-sdk-6.0.100-rc.1.21463.6-osx-x64.pkg"
    else
        url "https://download.visualstudio.microsoft.com/download/pr/80b891ce-2814-4368-b255-04513b5a3743/f08abf896b03124744c32a2e86749a75/dotnet-sdk-#{version.before_comma}-osx-arm64.pkg"
        sha256 "2db873515de42a596a25ac7554fa5828c057d2276cff93a492bc566b640fc221"
        pkg "dotnet-sdk-6.0.100-rc.1.21463.6-osx-arm64.pkg"
    end

    name ".NET SDK 6.0.100-rc.1.21463.6,6.0.0-rc.1"
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
