{ config, pkgs, lib, ... }:

{
  # Niri 配置
  programs.niri = {
    enable = true;
    # 可以添加更多niri特定配置
  };

  # 确保 Wayland 基础支持
  xdg.portal = {
    enable = true;
    wlr.enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk
    ];
  };

  # Niri 特定包
  environment.systemPackages = with pkgs; [
    niri
    wl-clipboard
    grim # 截图
    slurp # 区域选择
  ];

  # Wayland 环境变量
  environment.sessionVariables = {
    MOZ_ENABLE_WAYLAND = "1";
    NIXOS_OZONE_WL = "1";
    QT_QPA_PLATFORM = "wayland";
    QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
  };
}