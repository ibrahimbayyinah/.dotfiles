local g = require("config.globals")

local mainMod = g.mainMod
local terminal = g.terminal
local fileManager = g.fileManager
local menu = g.menu
local webbrowser = g.webbrowser

-- Gestures and keybinds

-- Gestures

local gestures = {
    changeWS = {
        fingers = 3,
        direction = "horizontal",
        action = "workspace",
    },

    makeFullscreen = {
        fingers = 3,
        direction = "up",
        mods = mainMod,
        scale = 1.5,
        action = "fullscreen",
    },
    
    --[[
    gesture = 3, left, mod: SUPER, scale: 1.5, float
    gesture = 2, pinchout, mod: SUPER, dispatcher, exec zoom increase
    --]]
}

for _, gesture in pairs(gestures) do
    hl.gesture(gesture)
end

-- Keybinds

-- Example binds, see https://wiki.hypr.land/Configuring/Basics/Binds/ for more

local function key(mods, k)
    if mods == nil or mods == "" then
        return k
    end

    return mods .. " + " .. k
end

-- Apps & scripts

local app_binds = {
    -- Apps
    { key = key(mainMod, "RETURN"), cmd = terminal },
    { key = key(mainMod, "B"), cmd = webbrowser },
    { key = key(mainMod, "E"), cmd = fileManager },
    { key = key(mainMod, "SPACE"), cmd = menu },
    { key = key(mainMod, "grave"), cmd = "wofi-emoji" },
    
    -- Screenshots
    { key = key(nil, "Print"), cmd = "grimblast --notify --cursor copysave area" },
    { key = key(mainMod, "Print"), cmd = "grimblast --notify --cursor copysave output" },
    { key = key("SHIFT", "Print"), cmd = "grimblast --notify --cursor copy area" },
    { key = key(mainMod .. " + SHIFT", "Print"), cmd = "grimblast --notify --cursor edit area" },
    
    -- Scripts
    { key = key(mainMod, "N"), cmd = "~/.local/scripts/mount_nash.sh" },
}

for _, bind in ipairs(app_binds) do
    hl.bind(bind.key, hl.dsp.exec_cmd(bind.cmd))
end


-- Laptop multimedia keys for volume and LCD brightness

local media_binds = {
    -- Volume
    { key = key(nil, "XF86AudioRaiseVolume"), cmd = "changevolume up" },
    { key = key(nil, "XF86AudioLowerVolume"), cmd = "changevolume down" },
    { key = key(nil, "XF86AudioMute"), cmd = "changevolume mute" },
    
    -- Brightness
    { key = key(nil, "XF86MonBrightnessUp"), cmd = "changebrightness up" },
    { key = key(nil, "XF86MonBrightnessDown"), cmd = "changebrightness down" },
}

for _, bind in ipairs(media_binds) do
    hl.bind(bind.key, hl.dsp.exec_cmd(bind.cmd), { locked = true, repeating = true })
end

--[[
-- Requires playerctl
hl.bind("XF86AudioNext",  hl.dsp.exec_cmd("playerctl next"),       { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay",  hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev",  hl.dsp.exec_cmd("playerctl previous"),   { locked = true })
--]]

-- Move focus with mainMod + arrow/vim keys

local direction_binds = {
    -- left = "left",
    H = "left",
    -- right = "right",
    L = "right",
    -- up = "up",
    K = "up",
    J = "down",
}

for k, dir in pairs(direction_binds) do
    hl.bind(key(mainMod, k), hl.dsp.focus({ direction = dir }))
    hl.bind(key(mainMod, dir), hl.dsp.focus({ direction = dir }))
end

--[[
local focus_binds = {
    { key = key(mainMod, "left"), direction = "left" },
    { key = key(mainMod, "right"), direction = "right" },
    { key = key(mainMod, "up"), direction = "up" },
    { key = key(mainMod, "down"), direction = "down" },
}
for _, bind in ipairs(focus_binds) do
    hl.bind(bind.key, hl.dsp.focus({ direction = bind.direction }))
end
--]]

-- Switch workspaces with mainMod + [0-9]
-- Move active window to a workspace with mainMod + SHIFT + [0-9]
for i = 1, 10 do
    local k = tostring(i % 10) -- 10 maps to key 0
    hl.bind(key(mainMod, k), hl.dsp.focus({ workspace = i}))
    hl.bind(key(mainMod .. " + SHIFT", k), hl.dsp.window.move({ workspace = i }))
end

-- Example special workspace (scratchpad)
hl.bind(key(mainMod, "S"), hl.dsp.workspace.toggle_special("magic"))
hl.bind(key(mainMod .. " + SHIFT", "S"), hl.dsp.window.move({ workspace = "special:magic" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Scroll through existing workspaces with mainMod + scroll
-- hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
-- hl.bind(mainMod .. " + mouse_up",   hl.dsp.focus({ workspace = "e-1" }))

-- Window binds
local closeWindowBind = hl.bind(key(mainMod, "Q"), hl.dsp.window.close())
-- closeWindowBind:set_enabled(false)
hl.bind(key(mainMod, "F"), hl.dsp.window.float({ action = "toggle" }))
hl.bind(key(mainMod, "P"), hl.dsp.window.pseudo({ action = "toggle" }))
-- hl.bind(key(mainMod, "P"), hl.dsp.window.pseudo())
hl.bind(key(mainMod, "U"), hl.dsp.layout("togglesplit"))    -- dwindle only
hl.bind(key(mainMod, "M"), hl.dsp.window.fullscreen({ mode = "maximized", action = "toggle" }))
hl.bind(key(mainMod .. " + ALT", "M"), hl.dsp.window.fullscreen({ mode = "fullscreen", action = "toggle" }))
hl.bind(key(mainMod .. " + SHIFT", "M"), hl.dsp.window.fullscreen())

-- Session binds
-- hl.bind(key(mainMod .. " + SHIFT", "Q"), hl.dsp.exit())
hl.bind(key(mainMod .. " + CONTROL", "Q"), hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'"))
hl.bind(key(mainMod .. " + CONTROL", "R"), hl.dsp.exec_cmd([[hyprshutdown -t 'Rebooting...' --post-cmd 'reboot']]))

-- Zoom
hl.bind(key(mainMod, "equal"), hl.dsp.exec_cmd("zoom increase"), { repeating = true })
hl.bind(key(mainMod, "minus"), hl.dsp.exec_cmd("zoom decrease"), { repeating = true })
hl.bind(key(mainMod .. " + SHIFT", "equal"), hl.dsp.exec_cmd("zoom reset"))
hl.bind(key(mainMod, "mouse_up"), hl.dsp.exec_cmd("zoom decrease"))
hl.bind(key(mainMod, "mouse_down"), hl.dsp.exec_cmd("zoom increase"))
hl.bind(key(mainMod, "mouse:274"), hl.dsp.exec_cmd("zoom reset"))

-- Switch binds
hl.bind("switch:on:ThinkPad Extra Buttons", hl.dsp.exec_cmd("auto_rotation.sh"), { locked = true })
hl.bind("switch:off:ThinkPad Extra Buttons", hl.dsp.exec_cmd("pkill -f auto_rotation.sh"), { locked = true })
hl.bind("switch:Lid Switch", hl.dsp.exec_cmd("hyprlock"), { locked = true })