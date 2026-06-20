local statusbar = require("config.globals").statusbar

local commands = {
    "swaync & udiskie",
    statusbar,
    "systemctl --user start hyprpolkitagent",
    "wl-paste --type text --watch cliphist store",
    "wl-paste --type image --watch cliphist store",
    "wl-clip-persist --clipboard regular",
    "hyprpm reload -n",
    "~/.local/scripts/xdph-nuke.sh",
    "keepassxc",
    "dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
}

hl.on("hyprland.start", function()
    for _, cmd in ipairs(commands) do
        hl.exec_cmd(cmd)
    end
    -- hl.exec_cmd("keepassxc", { workspace = 0 })
    -- wl-paste --type text --watch cliphist store
end)
