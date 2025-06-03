{ config, pkgs, lib, ... }:

{
  # 打印服务
  services.printing = {
    enable = true;
    drivers = with pkgs; [
      gutenprint
      # 添加其他打印机驱动
    ];
  };
}