cask "dotnet-sdk-8-0-202" do
    version "8.0.202,8.0.3"
    
    if Hardware::CPU.intel?
        url "https://download.visualstudio.microsoft.com/download/pr/15530a86-8714-4828-a934-8058c3673e1a/738ed9cd4f6eaf7367c9bda26999652e/dotnet-sdk-#{version.before_comma}-osx-x64.pkg"
        sha256 "24f120baad91d7b445507f9d30b5e69471ee45b95bbf297eda147217bc873542"
        pkg "dotnet-sdk-8.0.202-osx-x64.pkg"
    else
        url "https://download.visualstudio.microsoft.com/download/pr/4f1f4135-d42a-4ede-9838-85672f82f08c/fffd37265287676bb7b745f4531d8607/dotnet-sdk-#{version.before_comma}-osx-arm64.pkg"
        sha256 "5295e7735886e44cc9977b9f22aa4bc044fd03220931016c5267a5de44e70636"
        pkg "dotnet-sdk-8.0.202-osx-arm64.pkg"
    end

    name ".NET SDK 8.0.202,8.0.3"
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