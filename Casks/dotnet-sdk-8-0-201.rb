cask "dotnet-sdk-8-0-201" do
    version "8.0.201,8.0.2"
    
    if Hardware::CPU.intel?
        url "https://download.visualstudio.microsoft.com/download/pr/9508dade-753c-45eb-8220-216e8b552548/a5fc65c2b7ef2df9dfa003fbeac44f9f/dotnet-sdk-#{version.before_comma}-osx-x64.pkg"
        sha256 "3164400451529ce737e87e7b39e1c5a19dff977b44e775227ecced12b6d124cb"
        pkg "dotnet-sdk-8.0.201-osx-x64.pkg"
    else
        url "https://download.visualstudio.microsoft.com/download/pr/ca8378e2-a2b8-4dc9-b54b-206feeff5ec5/22fdb7f35fab91ba799ea05bcae84742/dotnet-sdk-#{version.before_comma}-osx-arm64.pkg"
        sha256 "bfa63f01d1180c4596f5b06e99cad6442dd665965e6d2b5fba333566a4ef1bea"
        pkg "dotnet-sdk-8.0.201-osx-arm64.pkg"
    end

    name ".NET SDK 8.0.201,8.0.2"
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