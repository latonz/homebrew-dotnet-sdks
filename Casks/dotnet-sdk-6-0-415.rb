cask "dotnet-sdk-6-0-415" do
    version "6.0.415,6.0.23"
    
    if Hardware::CPU.intel?
        url "https://download.visualstudio.microsoft.com/download/pr/df136a69-ab21-4938-ae40-785862f52445/e220acaad09b018a0b0b622710694367/dotnet-sdk-#{version.before_comma}-osx-x64.pkg"
        sha256 "1720b5ae2467c3f17266afac25b161ee30e27287307263a98b91defaffd8c7c1"
        pkg "dotnet-sdk-6.0.415-osx-x64.pkg"
    else
        url "https://download.visualstudio.microsoft.com/download/pr/db68b8a6-fd16-4a90-ad4c-9f349335785a/ad03eae1b78be886c0f15a49cc54d999/dotnet-sdk-#{version.before_comma}-osx-arm64.pkg"
        sha256 "a88174fd5b75499d97ec792f10baf7c3681fec6effde16635f493ebbf0899e25"
        pkg "dotnet-sdk-6.0.415-osx-arm64.pkg"
    end

    name ".NET SDK 6.0.415,6.0.23"
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
