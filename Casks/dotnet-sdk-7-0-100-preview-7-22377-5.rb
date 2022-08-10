cask "dotnet-sdk-7-0-100-preview-7-22377-5" do
    version "7.0.100-preview.7.22377.5,7.0.0-preview.7"
    
    if Hardware::CPU.intel?
        url "https://download.visualstudio.microsoft.com/download/pr/c4688e7c-6076-4e7c-bc8d-99ff138f91ce/059f21d41a3e06aeba8ef02d465887ab/dotnet-sdk-#{version.before_comma}-osx-x64.pkg"
        sha256 "d37cd53a737ff1c05310e3e71dcee260b17196476b9c8c4bfa5bb3ac8b6d06a9"
        pkg "dotnet-sdk-7.0.100-preview.7.22377.5-osx-x64.pkg"
    else
        url "https://download.visualstudio.microsoft.com/download/pr/064356b7-bf90-4c32-bfa9-f5acad1b24fb/dafa5b5f0b7c57d851f5af4d78db2f61/dotnet-sdk-#{version.before_comma}-osx-arm64.pkg"
        sha256 "dd2cac1674c8208c9bfe9735833d18cabd57e116b998133c14e1eb3bd7251816"
        pkg "dotnet-sdk-7.0.100-preview.7.22377.5-osx-arm64.pkg"
    end

    name ".NET SDK 7.0.100-preview.7.22377.5,7.0.0-preview.7"
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
