function switchscheme -d "set colorscheme"
  mv $HOME/.config/termite/config $HOME/.config/termite/tmp
  mv $HOME/.config/termite/second $HOME/.config/termite/config
  mv $HOME/.config/termite/tmp $HOME/.config/termite/second
end
