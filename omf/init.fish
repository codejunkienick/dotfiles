alias gl="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias ls='ls --color=auto'
alias lsdir="ls -la --color | grep \"^d\" and ls -la --color | grep \"^-\" and ls -la --color | grep \"^l\""
alias cp="rsync -ah --progress"  
alias termtitle="~/scripts/termtitle.sh"
alias pomodoro="gnome-pomodoro"
alias google-chrome="google-chrome-stable"
alias in='task add +in'
alias git='hub'
alias vim='nvim'
eval (dircolors -c ~/.dircolors | sed 's/>&\/dev\/null$//')

set fish_greeting ""
set -g theme_nerd_fonts yes
set -x VIRTUAL_ENV_DISABLE_PROMPT 1
set -U grcplugin_ls --color -l
set -x  FZF_DEFAULT_COMMAND 'rg --files --no-ignore --hidden --follow --glob "!.git/*'

bind \cp 'vim (fzf)'

#ENV variables
set -gx TERM xterm-256color
set -gx NVM_DIR /usr/share/nvm
set -x GOPATH ~/bin
set -gx BROWSER /usr/bin/google-chrome-beta
set -x PATH $PATH ~/bin
set -x PATH $PATH ~/.cargo/bin
set -x PS1 '\[\033[0;35m\]\u@ \[\033[0;33m\]\W\[\033[00m\] $ '
set -x DISPLAY :0
set -x WINEPREFIX /home/nick/Data/wine
set -x  PIP_CONFIG_FILE /dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps *.whl

set -x ANDROID_HOME /opt/android-sdk
set -x PATH $PATH $ANDROID_HOME/emulator
set -x PATH $PATH $ANDROID_HOME/tools
set -x PATH $PATH $ANDROID_HOME/tools/bin
set -x PATH $PATH $ANDROID_HOME/platform-tools

#Radios
alias radio.kexp="mpv --playlist ~/Radio/kexp.pls"
alias radio.roomy="mpv  http://s6.radioheart.ru:8007/live"
alias radio.kuvo="mpv  http://kuvo-ice.streamguys.org/kuvo-aac-64"
alias radio.wfmu="mpv  --playlist ~/Radio/wfmu.pls"
alias radio.resonance="mpv --playlist http://radio.canstream.co.uk:8004/live.mp3.m3u"

alias quik="env LC_ALL="ru_RU.UTF-8" WINEPREFIX="/home/nick/.wine" wine C:\\\\Open_Broker_QUIK\\\\info.exe"


