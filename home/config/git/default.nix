{ config, pkgs, ... }:

{
  programs = {
    git = {
      enable = true;
      userName = "jiangdengke";
      userEmail = "jiang1728439852@gmail.com";
      signing = {
        key = "2B4A9C6E0B38DDBE";
        signByDefault = true;
      };
      delta.enable = true;
      extraConfig = {
        pull = {
          rebase = false;
        };
        url = {
          "git@github.com:" = {
            insteadOf = "gh:";
          };
          "https://github.com/" = {
            insteadOf = "github:";
          };
        };
      };
    };
  };
}
