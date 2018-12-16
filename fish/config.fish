
# Path to Oh My Fish install.
#


eval (direnv hook fish)
set -gx OMF_PATH "$HOME/.local/share/omf"

set -gx LANG "en_US.UTF-8"
set -gx LANGUAGE "en_US.UTF-8"

# Customize Oh My Fish configuration path.
#set -gx OMF_CONFIG "/home/codejunkienick/.config/omf"
set -gx QUOTING_STYLE "literal"
set -gx EDITOR "nvim"

# Load oh-my-fish configuration.
source "$HOME/.local/share/omf/init.fish"


# Hook for desk activation
test -n "$DESK_ENV"; and . "$DESK_ENV"; or true
