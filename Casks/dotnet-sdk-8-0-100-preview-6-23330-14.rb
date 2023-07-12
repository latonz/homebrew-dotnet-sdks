cask "dotnet-sdk-8-0-100-preview-6-23330-14" do
    version "8.0.100-preview.6.23330.14,8.0.0-preview.6"
    
    if Hardware::CPU.intel?
        url "https://download.visualstudio.microsoft.com/download/pr/6672a02f-48fd-4f4b-80cd-ed58f8a59f85/112dc40e791e651a818780d5054622f0/dotnet-sdk-#{version.before_comma}-osx-x64.pkg"
        sha256 "12b7d83639a9dbb5f1219e040c7ec4ace037386761e0f4fe2144d6dee0ca523a"
        pkg "dotnet-sdk-8.0.100-preview.6.23330.14-osx-x64.pkg"
    else
        url "https://download.visualstudio.microsoft.com/download/pr/7f22cf54-5a57-496d-91a2-87a6ad84f082/0c8e092af75683cf7703193b6473e608/dotnet-sdk-#{version.before_comma}-osx-arm64.pkg"
        sha256 "73f8d6e8d9d44131a70258a5c98463e03e2b21efcb27ae4a09df87f4c9905ff9"
        pkg "dotnet-sdk-8.0.100-preview.6.23330.14-osx-arm64.pkg"
    end

    name ".NET SDK 8.0.100-preview.6.23330.14,8.0.0-preview.6"
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
