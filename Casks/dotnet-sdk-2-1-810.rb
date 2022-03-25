cask "dotnet-sdk-2-1-810" do
    version "2.1.810,2.1.22"
    
    url "https://download.visualstudio.microsoft.com/download/pr/1c1abbc4-1944-42e3-a591-4c665ffef858/328023243b52a9d165523c693ed83a93/dotnet-sdk-#{version.before_comma}-osx-x64.pkg"
    sha256 "6cf305360bc584e81e329ae806e2728bbb5266e93764fc591d60e812e6db32e0"
    pkg "dotnet-sdk-2.1.810-osx-x64.pkg"

    name ".NET Core SDK 2.1.810,2.1.22"
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
