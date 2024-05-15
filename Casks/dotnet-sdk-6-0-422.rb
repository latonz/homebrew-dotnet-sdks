cask "dotnet-sdk-6-0-422" do
    version "6.0.422,6.0.30"
    
    if Hardware::CPU.intel?
        url "https://download.visualstudio.microsoft.com/download/pr/ce675d3b-f53e-4638-a758-6c2c1fff25dd/ca400cd93ebb189399599589ad6c352c/dotnet-sdk-#{version.before_comma}-osx-x64.pkg"
        sha256 "960ece197a4f98d742eff5220c4d581f1cc6d4e2b70bd685015ce47110f57c2b"
        pkg "dotnet-sdk-6.0.422-osx-x64.pkg"
    else
        url "https://download.visualstudio.microsoft.com/download/pr/6427e918-a7a3-4c2c-81f3-15f92e61e661/468d9aaaff48719810e170b0ccf679e8/dotnet-sdk-#{version.before_comma}-osx-arm64.pkg"
        sha256 "2f8db7811bd72a80f8333e6ad9b682a42a4ba862ec860620716528f91339c5ec"
        pkg "dotnet-sdk-6.0.422-osx-arm64.pkg"
    end

    name ".NET SDK 6.0.422,6.0.30"
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