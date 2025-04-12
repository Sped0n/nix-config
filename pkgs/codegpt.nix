{
  lib,
  buildGoModule,
  fetchFromGitHub,
  git,
}:
buildGoModule rec {
  pname = "codegpt";
  version = "0.4.3"; # <-- Update this when a new version is released

  src = fetchFromGitHub {
    owner = "appleboy";
    repo = "CodeGPT";
    rev = "v${version}";
    # Get this hash by running:
    # nix run nixpkgs#nix-prefetch-github -- appleboy CodeGPT --rev v0.4.3
    hash = "sha256-FfbcL6tCg+JZ3BoE/YGVPu+LGvemUWGfl5RH+raZZ78="; # <-- Update this when a new version is released
  };

  # To obtain the actual hash, set vendorHash = lib.fakeHash; and run the build
  # you will get a error message with the real vendorHash
  vendorHash = "sha256-ublBYHjwM++1pzChND0Xjh66EG+bf9izhJzzcjhvtwY="; # <-- Update this when a new version is released
  # Ignore the inconsistent vendor directory from the source archive
  # and fetch dependencies based on go.mod/go.sum via Nix proxy.
  proxyVendor = true;

  ldflags = [
    "-s"
    "-w"
    "-X github.com/appleboy/CodeGPT/cmd.Version=v${version}"
    "-X github.com/appleboy/CodeGPT/cmd.Commit=v${version}"
  ];

  # Add git as a dependency needed during the test phase
  nativeBuildInputs = [git];

  meta = with lib; {
    description = "CLI to generate git commit messages or code reviews using ChatGPT AI";
    homepage = "https://github.com/appleboy/CodeGPT";
    license = licenses.mit;
    maintainers = with maintainers; [Sped0n];
    platforms = platforms.unix;
  };
}
