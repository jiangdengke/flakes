{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
#    home-manager.url = "github:nix-community/home-manager";
#    home-manager.inputs.nixpkgs.follows = "nixpkgs";
     home-manager = {
        url = "github:nix-community/home-manager/master";
        inputs.nixpkgs.follows = "nixpkgs";
    };


        # 添加 niri-flake 作为输入
#     niri.url = "github:sodiboo/niri-flake";
    daeuniverse.url = "github:daeuniverse/flake.nix";
  };

  outputs =
#     { nixpkgs, home-manager, daeuniverse, niri, ... }:
    { nixpkgs, home-manager, daeuniverse, ... }:

    {
      nixosConfigurations = {
       MyNixOS = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
            ./configuration.nix

            home-manager.nixosModules.home-manager{
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.jdk = ./home;
            }
            daeuniverse.nixosModules.daed


          ];
        };
      };
    };
}
