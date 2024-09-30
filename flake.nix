{
  description = "phlourish's nixos configuration flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";
    unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    nixos-hardware.url = "github:nixos/nixos-hardware";

    home-manager = {
        url = "github:nix-community/home-manager/release-24.05";
        inputs.nixpkgs.follows = "nixpkgs";
    };

    snowfall-lib = {
        url = "github:snowfallorg/lib";
        inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs:
    inputs.snowfall-lib.mkFlake {
        # snowfall cfg
        snowfall = {
            namespace = "internal"; # default namespace
            meta = {
                name = "phlourish";
                title = "phlourish's nixos configuration flake";
            };
        };

        # provide inputs to snowfall lib
        inherit inputs;
        # use flake root directory as src
        src = ./.;

        channels-config.allowUnfree = true;

        systems.modules = with inputs; [
            home-manager.nixosModules.home-manager
        ];

        systems.hosts.friedrich.modules = with inputs; [
            nixos-hardware.nixosModules.lenovo-thinkpad-t480
        ];
    };
}
