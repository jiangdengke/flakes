{ config, pkgs, lib, ... }:

{
  # 硬件支持
  hardware = {
    enableAllFirmware = true;
    opengl = {
      enable = true;
      driSupport = true;
    };
    # 可以添加其他硬件配置，如声音、蓝牙等
  };

  # 电源管理
  powerManagement.enable = true;
}