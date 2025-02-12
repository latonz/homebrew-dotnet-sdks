cask "dotnet-sdk-9-0-200" do
    version "9.0.200,9.0.2"
    
    if Hardware::CPU.intel?
        url "https://download.visualstudio.microsoft.com/download/pr/24e6d730-e336-4ba9-a248-4519bdd38251/e35a7403d4b03ffa8ced47dff6b3111f/dotnet-sdk-#{version.before_comma}-osx-x64.pkg"
        sha256 "ed1231de3171af78cfc26fa431b4629004d118e74ddac688d77de9455e09793e"
        pkg "dotnet-sdk-9.0.200-osx-x64.pkg"
    else
        url "https://download.visualstudio.microsoft.com/download/pr/b5dfd4eb-19f4-4ba5-9a0c-50af354aa434/3f307be41112d4a8de659535e8badff2/dotnet-sdk-#{version.before_comma}-osx-arm64.pkg"
        sha256 "4c78aa9b9762db73f2076d7464b7d4865c29ef8ff9e1fdf90379ebed66458c2e"
        pkg "dotnet-sdk-9.0.200-osx-arm64.pkg"
    end

    name ".NET SDK 9.0.200,9.0.2"
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