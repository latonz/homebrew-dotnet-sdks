cask "dotnet-sdk-8-0-400" do
    version "8.0.400,8.0.8"
    
    if Hardware::CPU.intel?
        url "https://download.visualstudio.microsoft.com/download/pr/a3bb8bc8-66dc-402e-9ced-a53241c4c15e/fc855e95c2e04813fa1efd64cc17ce86/dotnet-sdk-#{version.before_comma}-osx-x64.pkg"
        sha256 "ecbf70578cc568bbe164045b0f8361b85547d50452321f2f45d70408b5c0e34c"
        pkg "dotnet-sdk-8.0.400-osx-x64.pkg"
    else
        url "https://download.visualstudio.microsoft.com/download/pr/06edb9e2-e2bc-4692-a26f-df48c67d9292/2058cb632932d3c63fb78cd54692bc88/dotnet-sdk-#{version.before_comma}-osx-arm64.pkg"
        sha256 "e3c97599acefb9d085e0acaa70ec14877a661021e483be218a7ec78cabc34843"
        pkg "dotnet-sdk-8.0.400-osx-arm64.pkg"
    end

    name ".NET SDK 8.0.400,8.0.8"
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