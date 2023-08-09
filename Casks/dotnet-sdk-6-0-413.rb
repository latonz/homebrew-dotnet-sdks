cask "dotnet-sdk-6-0-413" do
    version "6.0.413,6.0.21"
    
    if Hardware::CPU.intel?
        url "https://download.visualstudio.microsoft.com/download/pr/f8ef7ef6-04f0-4d7f-a39d-127d7cf099a9/021922f4a6860bcd8257df91a53cb5d0/dotnet-sdk-#{version.before_comma}-osx-x64.pkg"
        sha256 "923595db0d47b07cc2122cb850b68ea52fb9de333c61c66a0a87b45aaa633809"
        pkg "dotnet-sdk-6.0.413-osx-x64.pkg"
    else
        url "https://download.visualstudio.microsoft.com/download/pr/d95d315f-8088-440b-88db-1e84398f6167/0a450912f02c207430bcc4bc9aaeefc1/dotnet-sdk-#{version.before_comma}-osx-arm64.pkg"
        sha256 "f189791a8ece710469d51d8f4195437de2b83a8841881c001fd4ce039f922f96"
        pkg "dotnet-sdk-6.0.413-osx-arm64.pkg"
    end

    name ".NET SDK 6.0.413,6.0.21"
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
