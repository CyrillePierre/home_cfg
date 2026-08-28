{ pkgs }:
with pkgs; [
  git
  delta
  ripgrep
  fd
  jq
  htop
  neovim
  tmux
  bitwarden-cli
  lazygit
  socat
  # zsh
  nix-zsh-completions
  bat
  zoxide
]
