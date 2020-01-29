#!/bin/bash
# Setup fish
sudo pacman -S fish fasd fzf hub neovim yarn nodejs chromium telegram-desktop
curl -L https://get.oh-my.fish | fish
curl https://git.io/fisher --create-dirs -sLo ~/.config/fish/functions/fisher.fish

# Aur FISH deps
pamac build direnv
pamac build the_platinum_searcher
pamac build nerd-fonts-iosevka

cd ~/.config
ln -s ~/Dotfiles/fish/config.fish config.fish 
ln -s ~/Dotfiles/omf omf                                                                                                                                                                                                                                                                               00:44:00
ln -s ~/Dotfiles/nvim nvim

omf install bobthefish fasd fzf


# Virt
sudo pacman -S qemu virt-manager libvirt

