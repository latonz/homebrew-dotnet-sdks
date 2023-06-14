cask "dotnet-sdk-8-0-100-preview-5-23303-2" do
    version "8.0.100-preview.5.23303.2,8.0.0-preview.5"
    
    if Hardware::CPU.intel?
        url "https://download.visualstudio.microsoft.com/download/pr/32b6e063-c6c3-427c-a734-e8fcf368c2a9/2abc4575ecd422aae6bc2bfe8c569be4/dotnet-sdk-#{version.before_comma}-osx-x64.pkg"
        sha256 "7bdbd173eae97361a33306e06ae98f2db03f51c2c9311720ee421a576c217bc8"
        pkg "dotnet-sdk-8.0.100-preview.5.23303.2-osx-x64.pkg"
    else
        url "https://download.visualstudio.microsoft.com/download/pr/c4f8255b-c638-4977-a407-b5f8e666ca22/a55fa273c57a3f754f9a6bfdb7132e39/dotnet-sdk-#{version.before_comma}-osx-arm64.pkg"
        sha256 "0408867832a3c23a9af53f404aec35a478e756123ec4ac6fb3d2b09d2972b7e3"
        pkg "dotnet-sdk-8.0.100-preview.5.23303.2-osx-arm64.pkg"
    end

    name ".NET SDK 8.0.100-preview.5.23303.2,8.0.0-preview.5"
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
