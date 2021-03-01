#!/bin/fish

cd ~/Work/appworkspace
alacritty -t imd-editor --working-directory  ./ -d 80 40 -e "nvim" &
sleep 0.2
 wmctrl -a imd-editor
qdbus org.kde.kglobalaccel /component/kwin invokeShortcut "Window to Screen 2"
qdbus org.kde.kglobalaccel /component/kwin invokeShortcut "Window Quick Tile Top"
# qdbus org.kde.kglobalaccel /component/kwin invokeShortcut "Window Maximize"

chromium http://localhost:8000 http://localhost:3000 --new-window &
sleep 0.2
wmctrl -a localhost
qdbus org.kde.kglobalaccel /component/kwin invokeShortcut "Window to Screen 1"
# qdbus org.kde.kglobalaccel /component/kwin invokeShortcut "Window Maximize"

slack &
sleep 0.2
wmctrl -a Slack
qdbus org.kde.kglobalaccel /component/kwin invokeShortcut "Window to Screen 2"
qdbus org.kde.kglobalaccel /component/kwin invokeShortcut "Window Quick Tile Bottom"
konsole -e "npm run start:staging-remote"
# qdbus org.kde.kglobalaccel /component/kwin invokeShortcut "Window to Screen 2"
