cask "dotnet-sdk-9-0" do
    version "9.0.311,9.0.13"
    
    if Hardware::CPU.intel?
        url "https://builds.dotnet.microsoft.com/dotnet/Sdk/#{version.before_comma}/dotnet-sdk-#{version.before_comma}-osx-x64.pkg"
        sha256 "890CC9AFCB418A7B6B557C2BC09DEC08A80286C99D52481DE87842DCBB116F65"
        pkg "dotnet-sdk-9.0.311-osx-x64.pkg"
    else
        url "https://builds.dotnet.microsoft.com/dotnet/Sdk/#{version.before_comma}/dotnet-sdk-#{version.before_comma}-osx-arm64.pkg"
        sha256 "69CF1A672B1B37CE62A8F770E88543961B554BFC296FA02EC07ADF5F3C1399AE"
        pkg "dotnet-sdk-9.0.311-osx-arm64.pkg"
    end

    name ".NET SDK 9.0.311,9.0.13"
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