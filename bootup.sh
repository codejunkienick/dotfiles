#!/bin/bash
# Setup fish
sudo pacman -S fish fasd go fzf hub neovim yarn nodejs chromium telegram-desktop docker docker-compose keychain npm the_silver_searcher ripgrep alacritty
curl -L https://get.oh-my.fish | fish
curl https://git.io/fisher --create-dirs -sLo ~/.config/fish/functions/fisher.fish
omf install bobthefish fasd fzf

cd ~/.config
ln -s ~/dotfiles/fish/config.fish config.fish 
ln -s ~/dotfiles/omf omf                                                                                                                                                                                                                                      
ln -s ~/Dotfiles/nvim nvim
ln -s ~/Dotfiles/alacritty alacritty
ln -s ~/Dotfiles/coc coc


# Virt
sudo pacman -S qemu virt-manager libvirt

# Aur FISH deps
pamac build direnv
pamac build the_platinum_searcher
pamac build nerd-fonts-iosevka
