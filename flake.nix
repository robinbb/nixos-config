{
  inputs = {
    # Use `nix flake update` to update the flake to the latest revision of the chosen release channel.
    nixpkgs.url = "github:NixOS/nixpkgs?rev=bcd464ccd2a1a7cd09aa2f8d4ffba83b761b1d0e";
  };
  outputs = inputs@{ self, nixpkgs, ... }: {
    nixosConfigurations.tux1 = nixpkgs.lib.nixosSystem {
      modules = [ ./configuration.nix ];
    };
  };
}

