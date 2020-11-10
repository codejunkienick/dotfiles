
# Path to Oh My Fish install.
#

alias vim "nvim"
alias imd "~/dotfiles/run_imd.sh"
alias vimdiff "nvim -d"

eval (direnv hook fish)
eval (keychain --eval --quiet ~/.ssh/pi) 

set -gx OMF_PATH "$HOME/.local/share/omf"
set -gx LANG "en_US.UTF-8"
set -gx LANGUAGE "en_US.UTF-8"

# Customize Oh My Fish configuration path.
set -gx QUOTING_STYLE "literal"
set -gx EDITOR "nvim"
# set -gx ANDROID_SDK /opt/android-sdk/
# set -gx ANDROID_HOME /opt/android-sdk/
set -g theme_nerd_fonts yes

set -gx ANDROID_HOME "$HOME/Android/Sdk"
set -gx PATH "$ANDROID_HOME/emulator" "$ANDROID_HOME/tools"   "$ANDROID_HOME/tools/bin" "$ANDROID_HOME/platform-tools" $PATH

# Load oh-my-fish configuration.


# Hook for desk activation
test -n "$DESK_ENV"; and . "$DESK_ENV"; or true

