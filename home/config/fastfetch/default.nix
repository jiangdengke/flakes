{ config, lib, pkgs, ... }:

let
  # 配置文件的路径，假设它与此Nix文件在同一目录
  configPath = ./fastfetch-config.jsonc;
in
{
  config = {
    # 安装fastfetch包
    home.packages = with pkgs; [
      fastfetch
    ];

    # 将配置文件复制到正确的位置
    xdg.configFile."fastfetch/config.jsonc".source = configPath;
    xdg.configFile."fastfetch/nixos.png".source = ./nixos.png;

    # 可选：设置别名，使fastfetch更易使用
    programs.zsh.shellAliases = {
      fetch = "fastfetch";
      sysinfo = "fastfetch";
    };

    # 可选: 按需加入启动脚本
    programs.zsh.initExtra = lib.mkAfter ''
      # 如果是登录终端并且是首个终端窗口，显示系统信息
      if [[ -o login && $TERM != "dumb" && ! -e ~/.hushlogin ]]; then
        fastfetch
      fi
    '';
  };
}
