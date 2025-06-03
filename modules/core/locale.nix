{ config, pkgs, lib, ... }:

{
  # 时区和语言设置
  time.timeZone = "Asia/Shanghai";
  i18n = {
    defaultLocale = "zh_CN.UTF-8";
    supportedLocales = [ "zh_CN.UTF-8/UTF-8" "en_US.UTF-8/UTF-8" ];
    inputMethod = {
      enabled = "fcitx5";
      fcitx5.addons = with pkgs; [ fcitx5-rime fcitx5-chinese-addons ];
    };
  };

  # 控制台设置
  console = {
    font = "Lat2-Terminus16";
    keyMap = "us";
  };
}