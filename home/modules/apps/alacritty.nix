{ config, pkgs, lib, ... }:

{
  # Alacritty 配置
  programs.alacritty = {
    enable = true;
    settings = {
      font.normal.family = "JetBrains Mono";
      font.size = 12;
      window.opacity = 0.9;
      colors.primary = {
        background = "#1E1E2E";
        foreground = "#CDD6F4";
      };
    };
  };
}