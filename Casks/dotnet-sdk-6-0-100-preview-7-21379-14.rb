cask "dotnet-sdk-6-0-100-preview-7-21379-14" do
    version "6.0.100-preview.7.21379.14,6.0.0-preview.7"
    
    if Hardware::CPU.intel?
        url "https://download.visualstudio.microsoft.com/download/pr/9e02abfd-b421-4c43-8541-482f037ed19c/f61bd4f35c444710016db8b5a7206a97/dotnet-sdk-#{version.before_comma}-osx-x64.pkg"
        sha256 "72d04ec37d305be4d45b38d17f242c3fc9f21abf7a24c3a23284c05c7f7aa6ea"
        pkg "dotnet-sdk-6.0.100-preview.7.21379.14-osx-x64.pkg"
    else
        url "https://download.visualstudio.microsoft.com/download/pr/01d92318-8db9-40f2-b9b8-20586d7e8f40/37d13083ff512e2b10bc2fd0fdbb9358/dotnet-sdk-#{version.before_comma}-osx-arm64.pkg"
        sha256 "85f45dee8644e7cea3cb683925bc3374afb763443f3801697f8f58fc47f66016"
        pkg "dotnet-sdk-6.0.100-preview.7.21379.14-osx-arm64.pkg"
    end

    name ".NET SDK 6.0.100-preview.7.21379.14,6.0.0-preview.7"
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
