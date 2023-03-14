cask "dotnet-sdk-6-0-407" do
    version "6.0.407,6.0.15"
    
    if Hardware::CPU.intel?
        url "https://download.visualstudio.microsoft.com/download/pr/91b09d38-854f-4888-ae10-b337b8c42045/3207fd5f87fcc22959311e588e531947/dotnet-sdk-#{version.before_comma}-osx-x64.pkg"
        sha256 "a1ca85f4b2b976afb7c053cebf7f29c72a605473ba3df127af8cb2679bc38432"
        pkg "dotnet-sdk-6.0.407-osx-x64.pkg"
    else
        url "https://download.visualstudio.microsoft.com/download/pr/e953e1ca-4e28-4e40-b3de-c0bfce0596f1/43ec5885784a56be964baaf67b4a4742/dotnet-sdk-#{version.before_comma}-osx-arm64.pkg"
        sha256 "c319c9f9bf3de9e17254ba596cc044e807bc5987e8d27f088741221ae441f86e"
        pkg "dotnet-sdk-6.0.407-osx-arm64.pkg"
    end

    name ".NET SDK 6.0.407,6.0.15"
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
