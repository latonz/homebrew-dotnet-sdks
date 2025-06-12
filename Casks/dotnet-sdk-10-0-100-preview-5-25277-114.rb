cask "dotnet-sdk-10-0-100-preview-5-25277-114" do
    version "10.0.100-preview.5.25277.114,10.0.0-preview.5"
    
    if Hardware::CPU.intel?
        url "https://builds.dotnet.microsoft.com/dotnet/Sdk/#{version.before_comma}/dotnet-sdk-#{version.before_comma}-osx-x64.pkg"
        sha256 "8A7025C830780D1418B6AF5AF6784493F9250BA25C0BCE048731982CB4318CCE"
        pkg "dotnet-sdk-10.0.100-preview.5.25277.114-osx-x64.pkg"
    else
        url "https://builds.dotnet.microsoft.com/dotnet/Sdk/#{version.before_comma}/dotnet-sdk-#{version.before_comma}-osx-arm64.pkg"
        sha256 "B5A742077BC9DE0849C307FE715799101B636AD87091C3D7B8FE750529461E8D"
        pkg "dotnet-sdk-10.0.100-preview.5.25277.114-osx-arm64.pkg"
    end

    name ".NET SDK 10.0.100-preview.5.25277.114,10.0.0-preview.5"
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