cask "dotnet-sdk-11-0" do
    version "11.0.100-preview.4.26230.115,11.0.0-preview.4"
    
    if Hardware::CPU.intel?
        url "https://builds.dotnet.microsoft.com/dotnet/Sdk/#{version.before_comma}/dotnet-sdk-#{version.before_comma}-osx-x64.pkg"
        sha256 "9FA751346682347CD5C06EF43A1D1D7DD8A8C93ACFE6AF373E01718B43D3274B"
        pkg "dotnet-sdk-11.0.100-preview.4.26230.115-osx-x64.pkg"
    else
        url "https://builds.dotnet.microsoft.com/dotnet/Sdk/#{version.before_comma}/dotnet-sdk-#{version.before_comma}-osx-arm64.pkg"
        sha256 "8E53AEE87CC090447E357311A26093DE26414EBC948A313EBD7354C150FCF6E2"
        pkg "dotnet-sdk-11.0.100-preview.4.26230.115-osx-arm64.pkg"
    end

    name ".NET SDK 11.0.100-preview.4.26230.115,11.0.0-preview.4"
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