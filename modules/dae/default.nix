{ config, pkgs, lib, ... }:

{
  # dae 系统级配置
  services.daed = {
    enable = true;

    openFirewall = {
      enable = true;
      port = 12345;
    };

    # 默认选项
    # configDir = "/etc/daed";
    # listen = "127.0.0.1:2023";
  };

  # 添加 daed 到系统包
  environment.systemPackages = with pkgs; [
    daed
  ];
}