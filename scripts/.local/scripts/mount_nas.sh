#!/bin/sh

gio mount -a "${I_NAS_SHARE}" && notify-send "Mount" "Mounted share successfully"

# SYN_SHAREPW=`secret-tool lookup "${SYN_ATTR}"`
# printf "%s\n" "${SYN_SHAREPW}" | gio mount "${SYN_SHARE}"

gio mount "${I_SYN_SHARE}" && notify-send "Mount" "Mounted synbak successful"
