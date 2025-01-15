cask "dotnet-sdk-9-0-102" do
    version "9.0.102,9.0.1"
    
    if Hardware::CPU.intel?
        url "https://download.visualstudio.microsoft.com/download/pr/2bda19b1-6389-4520-8e5e-363172398741/662eee446961503151bb78c29997933e/dotnet-sdk-#{version.before_comma}-osx-x64.pkg"
        sha256 "775a7cca2e7178db25cb1fd9d0cdd19415fcb19c4c184535169ffe3aa5923b0f"
        pkg "dotnet-sdk-9.0.102-osx-x64.pkg"
    else
        url "https://download.visualstudio.microsoft.com/download/pr/96489126-b9ba-414a-a2d0-d8c5b61a22be/fe047e117e9cc43738ba2222f4769da2/dotnet-sdk-#{version.before_comma}-osx-arm64.pkg"
        sha256 "f128839d529d2908a4fa2068d06fab33bb6880790ed08966cad6ce844faf706a"
        pkg "dotnet-sdk-9.0.102-osx-arm64.pkg"
    end

    name ".NET SDK 9.0.102,9.0.1"
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