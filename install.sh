#!/usr/bin/env bash
set -euo pipefail

DOTFILES="$(dirname "$(realpath "$0")")"

# dependencies
sudo pacman -S --needed git neovim ripgrep fd tree-sitter-cli \
  nodejs npm gcc wl-clipboard qt6-declarative qt6-languageserver \
  tmux hyprland quickshell


link() { 
  local src="$DOTFILES/$1" dest="$2"
  if [ -e "$dest" ] && [ ! -L "$dest" ]; then
    mv "$dest" "$dest.bak.$(date +%s)"
  fi
  mkdir -p "$(dirname "$dest")"
  ln -sfn "$src" "$dest"
}


link nvim       "$HOME/.config/nvim"
link tmux       "$HOME/.config/tmux"
link quickshell "$HOME/.config/quickshell"
link hypr       "$HOME/.config/hypr"


nvim --headless "+Lazy! sync" +qa
echo "Done — launch nvim; parsers and LSP servers finish on first open."
