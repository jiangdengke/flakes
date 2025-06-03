{ config, pkgs, lib, ... }:

{
  # 系统级包
  environment.systemPackages = with pkgs; [
    # 基础工具
    wget
    curl
    git
    vim
    htop
    # 添加其他您需要的系统级包
  ];

  # Nix 配置
  nix = {
    settings = {
      auto-optimise-store = true;
      experimental-features = [ "nix-command" "flakes" ];
    };
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 30d";
    };
  };
}