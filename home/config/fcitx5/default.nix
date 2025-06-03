{ config, pkgs, ... }:

{
  i18n.inputMethod = {
    enable = true;
    type = "fcitx5";
    fcitx5 = {
      addons = with pkgs; [
        libsForQt5.fcitx5-qt
        fcitx5-gtk
        fcitx5-configtool
        fcitx5-fluent
        (fcitx5-rime.override {
          rimeDataPkgs = [
            # 这里只替换有问题的 outputs.packages 部分
            # 使用 fetchFromGitHub 直接获取 rime-ice
            (pkgs.fetchFromGitHub {
              owner = "iDvel";
              repo = "rime-ice";
              rev = "ab5bf4f20de28d3fd8f2f21653a2cfff64e1b4d7";  # 使用特定版本，可以更新为最新版本
              sha256 = "sha256-QIwcf+7C2h/3TAdwc19ntBgnDi3ZjoDngkJQ4HowGE8=";  # 对应的哈希值
            })
          ];
        })
      ];
      waylandFrontend = true;
      settings = {
        addons = {
          classicui.globalSection.Theme = "FluentDark-solid";
        };
        inputMethod = {
          "Groups/0" = {
            Name = "Default";
            "Default Layout" = "us";
            DefaultIM = "keyboard-us";
          };
          "Groups/0/Items/0" = {
            Name = "keyboard-us";
            Layout = "";
          };
          "Groups/0/Items/1" = {
            Name = "rime";
            Layout = "";
          };
        };
      };
    };
  };
}
