{ config, lib, pkgs, ... }:

{
  config = {
    # ZSH配置
    programs.zsh = {
      enable = true;

      # ZSH历史记录设置
      history = {
        size = 10000;
        path = "${config.xdg.dataHome}/zsh/history";
        ignoreDups = true;
        expireDuplicatesFirst = true;
        share = true;
      };

      # Oh-My-ZSH配置
      oh-my-zsh = {
        enable = true;
        plugins = [
          "git"          # Git集成
          "sudo"         # 按两次ESC前缀sudo
          "docker"       # Docker补全
          "history"      # 历史记录
          "z"            # 目录快速跳转
          "dirhistory"   # Alt+左右箭头浏览目录
          "colored-man-pages" # 彩色man页
        ];
        theme = "robbyrussell"; # 简洁高效的主题
      };

      # 常用别名
      shellAliases = {
        # 文件和目录
        ll = "ls -la";
        la = "ls -a";
        l = "ls -l";

        # 目录导航 - 修复了以点开头的别名
        "dot" = "cd ..";
        "dotdot" = "cd ../..";
        "dotdotdot" = "cd ../../..";

        # Home Manager相关
        update = "home-manager switch";
        hms = "home-manager switch";
        hme = "$EDITOR ~/.config/nixpkgs/home.nix";

        # 系统管理相关
        nixre = "sudo nixos-rebuild switch";
        nixup = "sudo nixos-rebuild switch --upgrade";
        flakere = "sudo nixos-rebuild switch --flake";

        # git相关
        gs = "git status";
        ga = "git add";
        gc = "git commit";
        gp = "git push";
        gl = "git pull";
        gd = "git diff";
        gco = "git checkout";
        gb = "git branch";

        # 安全措施
        rm = "rm -i";
        cp = "cp -i";
        mv = "mv -i";

        # 系统信息
        myip = "curl http://ipecho.net/plain; echo";
        ports = "netstat -tulanp";
      };

      # 初始化脚本
      initContent = ''
        # 自定义目录导航别名 - 在初始化脚本中定义，避免语法错误
        # 为某些命令禁用全局通配符展开
        alias sudo='noglob sudo '

        # 禁用特定字符的通配符处理
        disable -p '#'
        alias ..='cd ..'
        alias ...='cd ../..'
        alias ....='cd ../../..'

        # 自定义ZSH配置
        setopt AUTO_CD         # 允许直接输入目录名称进入目录
        setopt CORRECT         # 命令修正
        setopt EXTENDED_GLOB   # 扩展通配符
        setopt NO_CASE_GLOB    # 通配符匹配忽略大小写

        # 自定义环境变量
        export EDITOR=vim      # 默认编辑器
        export VISUAL=vim
        export LANG=zh_CN.UTF-8
        export LC_ALL=zh_CN.UTF-8
        export PATH=$HOME/.local/bin:$PATH

        # 目录导航增强
        setopt AUTO_PUSHD
        setopt PUSHD_IGNORE_DUPS
        setopt PUSHD_MINUS

        # 更友好的错误提示
        setopt CORRECT_ALL
        SPROMPT="输入错误，您是想执行 %r 吗？(y|n|e|a)"

        # 禁用CTRL-S锁定终端
        stty -ixon

        # 实用函数
        # 创建并进入目录
        function mkcd() {
          mkdir -p "$1" && cd "$1"
        }



        # 欢迎消息
        echo "欢迎回来，jdk！今天是$(date '+%Y年%m月%d日 %H:%M')"
      '';

      # 自动补全系统
      autosuggestion.enable = true;
      enableCompletion = true;

      # 语法高亮
      syntaxHighlighting.enable = true;

      # 为Flakes使用固定版本的插件 - 替换builtins.fetchGit
      plugins = [
        {
          # Nix集成插件
          name = "zsh-nix-shell";
          file = "nix-shell.plugin.zsh";
          src = pkgs.fetchFromGitHub {
            owner = "chisui";
            repo = "zsh-nix-shell";
            rev = "v0.5.0";
            sha256 = "0za4aiwwrlawnia4f29msk822rj9bgcygw6a8a6iikiwzjjz0g91";
          };
        }
      ];

      # 会话变量
      sessionVariables = {
        EDITOR = "vim";
        VISUAL = "vim";
        LESS = "-R";
        LESSHISTFILE = "-";
      };
    };

    # Starship提示符配置 (可选，可以注释掉此部分使用Oh-My-Zsh主题)
    programs.starship = {
      enable = true;
      enableZshIntegration = true;
      settings = {
        add_newline = false;
        character = {
          success_symbol = "[➜](bold green)";
          error_symbol = "[✗](bold red)";
        };
        # 自定义模块显示
        cmd_duration.show_milliseconds = true;
        username.show_always = true;
        directory.truncation_length = 3;
        git_branch.symbol = "🌱 ";
        nix_shell.symbol = "❄️ ";
      };
    };
  };
}
