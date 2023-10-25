cask "dotnet-sdk-7-0-403" do
    version "7.0.403,7.0.13"
    
    if Hardware::CPU.intel?
        url "https://download.visualstudio.microsoft.com/download/pr/4243dbe5-7173-4422-a073-b13395231cfa/808d2c3639437ef67630dc0083a0fbd6/dotnet-sdk-#{version.before_comma}-osx-x64.pkg"
        sha256 "7b4d9fd4d003b681240eb9e79d757c30aa7437774a49a2a15dd7a09947476635"
        pkg "dotnet-sdk-7.0.403-osx-x64.pkg"
    else
        url "https://download.visualstudio.microsoft.com/download/pr/70b57ca7-7fcb-432d-bad9-809dbcfc35a7/8fca3fbc3f6e638edb29a908621cf9ba/dotnet-sdk-#{version.before_comma}-osx-arm64.pkg"
        sha256 "a4b38ad38a0f40bf6e8d473628c0231b511124cfd6701dc488f2f51da6db5fa5"
        pkg "dotnet-sdk-7.0.403-osx-arm64.pkg"
    end

    name ".NET SDK 7.0.403,7.0.13"
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
