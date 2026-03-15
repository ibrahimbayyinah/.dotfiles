#!/usr/bin/env sh

export STATUS_FILE="$XDG_RUNTIME_DIR/VKBD.status"

enable_vkbd() {
    printf "true" >"$STATUS_FILE"
    notify-send -u normal "Enabling virtual keyboard"
    wvkbd-mobintl
}

disable_vkbd() {
    printf "false" >"$STATUS_FILE"
    notify-send -u normal "Disabling virtual keyboard"
    killall wvkbd-mobintl
}

if ! [ -f "$STATUS_FILE" ]; then
  enable_vkbd
else
  if [ $(cat "$STATUS_FILE") = "true" ]; then
    disable_vkbd
  elif [ $(cat "$STATUS_FILE") = "false" ]; then
    enable_vkbd
  fi
fi
