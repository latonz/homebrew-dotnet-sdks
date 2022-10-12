cask "dotnet-sdk-7-0-100-rc-2-22477-23" do
    version "7.0.100-rc.2.22477.23,7.0.0-rc.2"
    
    if Hardware::CPU.intel?
        url "https://download.visualstudio.microsoft.com/download/pr/f0721581-70fc-4a85-8f23-80312db2e709/67f5f1c05bc04e467ab773eac60d43c9/dotnet-sdk-#{version.before_comma}-osx-x64.pkg"
        sha256 "94f7ae20feaae4b6bc6e0643b839ea2bfb6f84beacc2dadcb72bbb276da350c0"
        pkg "dotnet-sdk-7.0.100-rc.2.22477.23-osx-x64.pkg"
    else
        url "https://download.visualstudio.microsoft.com/download/pr/98cb9882-cba6-436a-98b5-a546577c557e/5172040c5017f00f78abd6a33cc4dee9/dotnet-sdk-#{version.before_comma}-osx-arm64.pkg"
        sha256 "2898147037fe1945b9e18f1174c3b1094fec61aa15495d98c9f28de62ea63aba"
        pkg "dotnet-sdk-7.0.100-rc.2.22477.23-osx-arm64.pkg"
    end

    name ".NET SDK 7.0.100-rc.2.22477.23,7.0.0-rc.2"
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
