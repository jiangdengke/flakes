{ config, pkgs, lib, ... }:

{
  imports = [
    ./bootloader.nix
    ./hardware.nix
    ./locale.nix
    ./packages.nix
  ];
}