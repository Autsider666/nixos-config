{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "yorick";
  home.homeDirectory = "/home/yorick";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.05"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = [
    # # Adds the 'hello' command to your environment. It prints a friendly
    # # "Hello, world!" when run.
    # pkgs.hello

    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/yorick/etc/profile.d/hm-session-vars.sh
  #
  home = {
    sessionVariables = {
       EDITOR = "vim";
       MOZ_ENABLE_WAYLAND = 0;
       NIXOS_OZONE_WL = 1;
    };
  };

  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
    systemd.enable = true;

#    settings = {
#
#    };
  };

  # Let Home Manager install and manage itself.
  programs = {
#    bash = {
##      enable = true;
##      shellAliases = {
##        nixos-rebuild = "sudo nixos-rebuild switch --flake ~/nixos/";
##      };
#      sessionVariables = {
#         EDITOR = "vim";
#         MOZ_ENABLE_WAYLAND = 0;
#      };
#    };

    git = {
      enable = true;
      lfs.enable = true;
      userName = "Torick";
      userEmail = "yorickvanklinken@gmail.com";
#      signing = { # https://jeppesen.io/git-commit-sign-nix-home-manager-ssh/
#        key = "5C841D3CFDFEC4E0";
#        signByDefault = true;
#      };
      aliases = {
#        a = "add";
#        c = "commit";
#        ca = "commit --amend";
#        can = "commit --amend --no-edit";
#        cl = "clone";
#        cm = "commit -m";
        co = "checkout";
#        cp = "cherry-pick";
#        cpx = "cherry-pick -x";
#        d = "diff";
#        f = "fetch";
#        fo = "fetch origin";
#        fu = "fetch upstream";
        lol = "log --graph --decorate --pretty=oneline --abbrev-commit";
        lola = "log --graph --decorate --pretty=oneline --abbrev-commit --all";
#        pl = "pull";
#        pr = "pull -r";
#        ps = "push";
#        psf = "push -f";
#        rb = "rebase";
#        rbi = "rebase -i";
#        r = "remote";
#        ra = "remote add";
#        rr = "remote rm";
#        rv = "remote -v";
#        rs = "remote show";
        st = "status";
      };
#      extraConfig = {
#        merge = {
#          tool = "vimdiff";
#          conflictstyle = "diff3";
#        };
#        pull = {
#          rebase=true;
#        };
#        mergetool.prompt = "false";
#      };
#      includes = [
#        # use different signing key
#        {
#          condition = "gitdir:~/work/";
#          contents = {
#            user = {
#              name = "Jonathan Ringer";
#              email = "jonathan.ringer@iohk.io";
#              signingKey = "523B37EC8FB6E3A2";
#            };
#          };
#        }
#        # prevent background gc thread from constantly blocking reviews
#        {
#          condition = "gitdir:~/projects/nixpkgs";
#          contents = {
#            gc.auto = 0;
#          };
#        }
#      ];
    };

    zsh = {
      enable = true;
      enableCompletion = true;
      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;

      shellAliases = {
        update = "sudo nixos-rebuild switch --flake ~/nixos/";
        test = "sudo nixos-rebuild test --flake ~/nixos/";
      };
      history = {
        size = 10000;
        path = "${config.xdg.dataHome}/zsh/history";
      };

    };

    home-manager.enable = true;
  };
}
