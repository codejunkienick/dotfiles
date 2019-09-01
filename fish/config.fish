
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
set -gx ANDROID_SDK /opt/android-sdk/
set -gx ANDROID_HOME /opt/android-sdk/

# Load oh-my-fish configuration.
source "$HOME/.local/share/omf/init.fish"


# Hook for desk activation
test -n "$DESK_ENV"; and . "$DESK_ENV"; or true

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[ -f /home/codejunkienick/jobs/sip/node_modules/tabtab/.completions/serverless.fish ]; and . /home/codejunkienick/jobs/sip/node_modules/tabtab/.completions/serverless.fish
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[ -f /home/codejunkienick/jobs/sip/node_modules/tabtab/.completions/sls.fish ]; and . /home/codejunkienick/jobs/sip/node_modules/tabtab/.completions/sls.fish
# tabtab source for slss package
# uninstall by removing these lines or running `tabtab uninstall slss`
[ -f /home/codejunkienick/jobs/sip/node_modules/tabtab/.completions/slss.fish ]; and . /home/codejunkienick/jobs/sip/node_modules/tabtab/.completions/slss.fish