
# Path to Oh My Fish install.
#

alias vim "nvim"
alias imd "~/dotfiles/run_imd.sh"
alias imd:chrome "nohup -- chromium --new-window http://localhost:8000 http://localhost:3000"
alias vimdiff "nvim -d"

eval (direnv hook fish)
eval (keychain --eval --quiet ~/.ssh/pi) 

set -gx OMF_PATH "$HOME/.local/share/omf"
set -gx LANG "en_US.UTF-8"
set -gx LANGUAGE "en_US.UTF-8"
set -gx JUPYTERLAB_DIR "$HOME/.local/share/jupyter/lab"

# Customize Oh My Fish configuration path.
set -gx QUOTING_STYLE "literal"
set -gx EDITOR "nvim"
set -gx BROWSER "chromium"
# set -gx ANDROID_SDK /opt/android-sdk/
# set -gx ANDROID_HOME /opt/android-sdk/
set -g theme_nerd_fonts yes

set -gx ANDROID_HOME "$HOME/Android/Sdk"
set -gx PATH "$ANDROID_HOME/emulator" "$ANDROID_HOME/tools"   "$ANDROID_HOME/tools/bin" "$ANDROID_HOME/platform-tools" "/usr/local/go/bin" "$HOME/go/bin" "/home/nick/.local/bin" "/home/nick/.gem/ruby/2.7.0/bin" $PATH
# Load oh-my-fish configuration.


# Hook for desk activation
test -n "$DESK_ENV"; and . "$DESK_ENV"; or true


# tabtab source for packages
# uninstall by removing these lines
[ -f ~/.config/tabtab/__tabtab.fish ]; and . ~/.config/tabtab/__tabtab.fish; or true
