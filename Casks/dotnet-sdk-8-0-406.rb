cask "dotnet-sdk-8-0-406" do
    version "8.0.406,8.0.13"
    
    if Hardware::CPU.intel?
        url "https://download.visualstudio.microsoft.com/download/pr/d300f28c-e59b-43ec-bb57-b6e0320a86b2/a1f346317df06c5d8b8bf9785c9090e9/dotnet-sdk-#{version.before_comma}-osx-x64.pkg"
        sha256 "57dd68791875751aabe65d4c8612b29597ab2c218a7d85c4aa4dd4da7f7bf06d"
        pkg "dotnet-sdk-8.0.406-osx-x64.pkg"
    else
        url "https://download.visualstudio.microsoft.com/download/pr/b54de232-c38f-40ba-8ae7-51080435c258/5482d86b044fc3ec602685acde2993f8/dotnet-sdk-#{version.before_comma}-osx-arm64.pkg"
        sha256 "ba24b1867f8ec375cb0c125acbc1343938ee59efc243c6d96aa726a5cf23d1cf"
        pkg "dotnet-sdk-8.0.406-osx-arm64.pkg"
    end

    name ".NET SDK 8.0.406,8.0.13"
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