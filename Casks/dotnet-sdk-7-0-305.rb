cask "dotnet-sdk-7-0-305" do
    version "7.0.305,7.0.8"
    
    if Hardware::CPU.intel?
        url "https://download.visualstudio.microsoft.com/download/pr/cc993071-2ecd-415b-a055-2918072bbfd4/545947633a386671807fc3f3db511295/dotnet-sdk-#{version.before_comma}-osx-x64.pkg"
        sha256 "7e4918e12c3fb9fca97e58aef711359e27c5278fbfd83fbf5078ab9839c6dfbf"
        pkg "dotnet-sdk-7.0.305-osx-x64.pkg"
    else
        url "https://download.visualstudio.microsoft.com/download/pr/2dccbeef-704b-4bb9-984f-6d49ecef5e06/df1c7e68a77fc47ec0523942df43bbde/dotnet-sdk-#{version.before_comma}-osx-arm64.pkg"
        sha256 "925a7c0274100d9df6fd4e21b60278d9835b271ac387001bb637a78972c92b84"
        pkg "dotnet-sdk-7.0.305-osx-arm64.pkg"
    end

    name ".NET SDK 7.0.305,7.0.8"
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
