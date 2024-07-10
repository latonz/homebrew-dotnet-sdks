cask "dotnet-sdk-8-0-303" do
    version "8.0.303,8.0.7"
    
    if Hardware::CPU.intel?
        url "https://download.visualstudio.microsoft.com/download/pr/827eac3c-729c-4416-bdf4-0fae6ec6492f/40ccf2187797de61688d354da3e43090/dotnet-sdk-#{version.before_comma}-osx-x64.pkg"
        sha256 "8736c67245611b6c18e102e3b74035be03308b71709c29924503d8332e775a59"
        pkg "dotnet-sdk-8.0.303-osx-x64.pkg"
    else
        url "https://download.visualstudio.microsoft.com/download/pr/763ab233-7f0e-481c-8b8a-c432328330a5/8a1d8bed9188f553e1cd3ea2b615a93a/dotnet-sdk-#{version.before_comma}-osx-arm64.pkg"
        sha256 "fe05de094fdacf95c34fe641e630f224a13d10b0d426ed73ea3d735c55d8eb77"
        pkg "dotnet-sdk-8.0.303-osx-arm64.pkg"
    end

    name ".NET SDK 8.0.303,8.0.7"
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