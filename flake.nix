{
  inputs = {
    # Use `nix flake update` to update the flake to the latest revision of the chosen release channel.
    nixpkgs.url = "github:NixOS/nixpkgs?rev=71caefce12ba78d84fe618cf61644dce01cf3a96";
  };
  outputs = inputs@{ self, nixpkgs, ... }: {
    nixosConfigurations.tux1 = nixpkgs.lib.nixosSystem {
      modules = [ ./configuration.nix ];
    };
  };
}

