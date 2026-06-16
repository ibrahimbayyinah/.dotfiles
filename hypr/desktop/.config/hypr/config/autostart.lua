hl.on("hyprland.start", function()
    hl.exec_cmd("mako & /usr/lib/polkit-kde-authentication-agent-1 & udiskie & waybar")
    hl.exec_cmd("hyprpm reload -n")
    hl.exec_cmd("~/.local/scripts/xdph-nuke.sh")
    hl.exec_cmd("keepassxc", { workspace = "0" })
    hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
end)

--[[
local M = {
    "mako & /usr/lib/polkit-kde-authentication-agent-1 & udiskie & waybar",
    "hyprpm reload -n",
    "~/.local/scripts/xdph-nuke.sh",
}
--]]