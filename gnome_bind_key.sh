#!/usr/bin/env bash

bind_workspace() {
  echo "Bind workspace"
  for i in {1..9}; do
    gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-$i "['<Super>$i']"
    gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-$i "['<Super><Shift>$i']"
    gsettings set org.gnome.shell.keybindings switch-to-application-$i "[]"
  done
}

bind_some_key() {
  echo "Bind some key"
  echo "Bind Super + / to activate window menu"
  gsettings set org.gnome.desktop.wm.keybindings activate-window-menu "['<Super>slash']"
  echo "Bind Alt + q to close window"
  gsettings set org.gnome.desktop.wm.keybindings close "['<Alt>q']"
  echo "Bind Super + Shift + s to take screenshot UI"
  gsettings set org.gnome.settings-daemon.plugins.media-keys area-screenshot-clip "['<Super><Shift>s']"
  echo "Bind Ctrl + Super + Alt + p to shutdown"
}

remove_default_key() {
  echo "Remove default key"

  gsettings set org.gnome.shell.keybindings toggle-message-tray "[]"
}

bind_workspace
bind_some_key
remove_default_key
