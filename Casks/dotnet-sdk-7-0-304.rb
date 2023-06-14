cask "dotnet-sdk-7-0-304" do
    version "7.0.304,7.0.7"
    
    if Hardware::CPU.intel?
        url "https://download.visualstudio.microsoft.com/download/pr/6e4a2a04-483d-42d4-8cbd-27257c47a8bf/52917aad4fb720797c351e38fb706531/dotnet-sdk-#{version.before_comma}-osx-x64.pkg"
        sha256 "a1abd5a89b7c7ec309c211fc69654c7d30d3279b9be9fe59b0d4a72a61da0fd7"
        pkg "dotnet-sdk-7.0.304-osx-x64.pkg"
    else
        url "https://download.visualstudio.microsoft.com/download/pr/53f2dc54-c56d-4bc2-b7ac-4705565f1f58/ce10a5e5e5ed4acf1ea3caf443ecbd2e/dotnet-sdk-#{version.before_comma}-osx-arm64.pkg"
        sha256 "788f125b3ce3cae7e24afca788d60704cb115d0ea5c2cde088038db1f1eb0619"
        pkg "dotnet-sdk-7.0.304-osx-arm64.pkg"
    end

    name ".NET SDK 7.0.304,7.0.7"
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
