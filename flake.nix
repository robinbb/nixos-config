{
  inputs = {
    # Use `nix flake update` to update the flake to the latest revision of the chosen release channel.
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    claude-code.url = "github:sadjow/claude-code-nix";
  };

  outputs = inputs@{ self, nixpkgs, nixpkgs-unstable, claude-code, ... }: {
    nixosConfigurations.tux1 = nixpkgs.lib.nixosSystem {
      modules = [
        ./configuration.nix
        {
          nixpkgs.overlays = [
            (final: prev: {
              unstable = import nixpkgs-unstable {
                system = final.stdenv.hostPlatform.system;
                config.allowUnfree = true;
              };
            })
	    claude-code.overlays.default
          ];
        }
      ];
    };
  };
}
