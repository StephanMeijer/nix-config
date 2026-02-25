{ pkgs, ... }:

{
  home.stateVersion = "26.05";

  programs.home-manager.enable = true;

  home.packages = with pkgs; [
    # Editor
    neovim

    # Core CLI tools
    ripgrep
    ripgrep-all
    fd
    bfs
    bat
    eza
    fzf
    jq
    delta
    htop
    tokei
    tree
    zellij
    just
    shellcheck
    curl
    wget
    taskwarrior3

    # AI coding agents
    opencode

    # Code search (used by Claude/OpenCode skills)
    ast-grep
    universal-ctags
    cscope

    # Lua tooling (for nvim config)
    stylua
    selene
    gitleaks
    luaPackages.luacheck

    # Nix tooling (for nix-config repo)
    nixfmt
    statix
    deadnix
  ];
}
