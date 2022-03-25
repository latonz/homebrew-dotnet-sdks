cask "dotnet-sdk-6-0-100-preview-5-21302-13" do
    version "6.0.100-preview.5.21302.13,6.0.0-preview.5"
    
    if Hardware::CPU.intel?
        url "https://download.visualstudio.microsoft.com/download/pr/134a7c15-69cf-40b3-ba78-a78a666ac2de/996de9580ee6c05b2bcb0e9456fdf877/dotnet-sdk-#{version.before_comma}-osx-x64.pkg"
        sha256 "593cf446397766503f202bdfa3d5080a891fc84e6675bc9a885befeda030b35a"
        pkg "dotnet-sdk-6.0.100-preview.5.21302.13-osx-x64.pkg"
    else
        url "https://download.visualstudio.microsoft.com/download/pr/b1b77ccc-7428-4ab6-9bd5-dbde5e5fdb56/5a33c488a8bb58eaf1982a2edd2af2a2/dotnet-sdk-#{version.before_comma}-osx-arm64.pkg"
        sha256 "2295dbc157def86b6d3543dcc49ea691d3386bfd47d5b3e7ddef6525381199cc"
        pkg "dotnet-sdk-6.0.100-preview.5.21302.13-osx-arm64.pkg"
    end

    name ".NET SDK 6.0.100-preview.5.21302.13,6.0.0-preview.5"
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
