cask "dotnet-sdk-7-0" do
    version "7.0.100-preview.2.22153.17,7.0.0-preview.2"
    
    if Hardware::CPU.intel?
        url "https://download.visualstudio.microsoft.com/download/pr/f6ec71c8-fc91-49f4-8409-f36e5b58902a/3d3ccb4dcaf0823d55ecd470854cb2c8/dotnet-sdk-#{version.before_comma}-osx-x64.pkg"
        sha256 "b8ccf8528f6314fd2520550b8eb3bb3e503d0f74114a7002d64832428542d256"
        pkg "dotnet-sdk-7.0.100-preview.2.22153.17-osx-x64.pkg"
    else
        url "https://download.visualstudio.microsoft.com/download/pr/cd80f4c1-b605-44d1-a322-f4e4e3c01776/c494ef9e353fe544830da1b6347859bd/dotnet-sdk-#{version.before_comma}-osx-arm64.pkg"
        sha256 "9a6617268fe344f077bd66e6dbb14cde6c16fa814ec829583e138055e87f0fd4"
        pkg "dotnet-sdk-7.0.100-preview.2.22153.17-osx-arm64.pkg"
    end

    name ".NET SDK 7.0.100-preview.2.22153.17,7.0.0-preview.2"
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
