{
  description = "jdk 的 NixOS 配置";

  inputs = {
    # 核心输入
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # dae 输入
    daeuniverse.url = "github:daeuniverse/flake.nix";
  };

  outputs = { self, nixpkgs, home-manager, daeuniverse, ... }@inputs:
    let
      system = "x86_64-linux"; # 或根据您的实际系统架构调整
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };
      lib = nixpkgs.lib;
    in {
      nixosConfigurations = {
        # 主系统配置
        MyNixOS = lib.nixosSystem {
          inherit system;
          specialArgs = {
            inherit inputs;
            username = "jdk"; # 集中定义用户名
          };
          modules = [
            # 主机配置
            ./hosts/mySystem.nix

            # dae 模块
            daeuniverse.nixosModules.daed

            # Home Manager 配置
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.jdk = import ./home;
              home-manager.extraSpecialArgs = {
                inherit inputs;
                username = "jdk"; # 保持用户名一致
              };
            }
          ];
        };
      };
    };
}