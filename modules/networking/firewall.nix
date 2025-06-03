{ config, pkgs, lib, ... }:

{
  # 防火墙设置
  networking.firewall = {
    enable = true;
    allowedTCPPorts = [ 22 ]; # SSH
    # 添加其他需要的端口
  };
}