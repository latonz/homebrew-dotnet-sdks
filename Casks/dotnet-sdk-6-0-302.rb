cask "dotnet-sdk-6-0-302" do
    version "6.0.302,6.0.7"
    
    if Hardware::CPU.intel?
        url "https://download.visualstudio.microsoft.com/download/pr/7257dada-8ec1-4b5c-9b69-7201a2cf377f/89f452882fb87fbb89d697417cb3f231/dotnet-sdk-#{version.before_comma}-osx-x64.pkg"
        sha256 "863a6b5a8ba6b0b2c1674bc952358e31c33cb0f4d98e8e6767241642bd1db9d1"
        pkg "dotnet-sdk-6.0.302-osx-x64.pkg"
    else
        url "https://download.visualstudio.microsoft.com/download/pr/7d98e8ca-e8ec-490b-8ffc-55a458981d86/32c92f3aa0f460119de53477cffa8a0a/dotnet-sdk-#{version.before_comma}-osx-arm64.pkg"
        sha256 "3f8acce92fd2fb1bafc9742fde3e389e7f3d609435052e7209f3ba4cdaee4228"
        pkg "dotnet-sdk-6.0.302-osx-arm64.pkg"
    end

    name ".NET SDK 6.0.302,6.0.7"
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
