{ config, pkgs, lib, ... }:

{
  imports = [
    ./firewall.nix
    ./wireless.nix
  ];

  # 基本网络设置
  networking = {
    useDHCP = false;
    networkmanager.enable = true;
  };
}