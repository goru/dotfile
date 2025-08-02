#!/bin/sh

export MOZ_ENABLE_WAYLAND=1
export SDL_VIDEODRIVER="wayland,x11"

export LC_ALL="ja_JP.utf8"
export LANG="ja_JP.utf8"

# https://fcitx-im.org/wiki/Using_Fcitx_5_on_Wayland
export XMODIFIERS="@im=fcitx"
export QT_IM_MODULE=fcitx
export GTK_IM_MODULE=fcitx

#exec dbus-run-session /usr/bin/Hyprland >$HOME/.config/hypr/hyprland.log 2>&1
exec dbus-run-session /usr/bin/Hyprland >/dev/null 2>&1
