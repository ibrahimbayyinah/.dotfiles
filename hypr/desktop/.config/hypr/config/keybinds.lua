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

-- hl.gesture({ fingers = 2, direction = "pinch", action = "cursorZoom", zoom_level = 2 })
-- hl.gesture({ fingers = 2, direction = "pinchin", action = "cursorZoom", zoom_level = 1.2, mode = "mult" })
hl.gesture({ fingers = 2, direction = "pinch", mods = mainMod, action = "cursorZoom", zoom_level = 1, mode = "live" })

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
    { key = key(mainMod, "RETURN"),              cmd = terminal },
    { key = key(mainMod, "B"),                   cmd = webbrowser },
    { key = key(mainMod, "E"),                   cmd = fileManager },
    { key = key(mainMod, "SPACE"),               cmd = menu },
    { key = key(mainMod, "grave"),               cmd = "wofi-emoji" },
    { key = key(mainMod, "C"),                   cmd = "vscodium" },

    -- Screenshots
    { key = key(nil, "Print"),                   cmd = "grimblast --notify --cursor copysave area" },
    { key = key(mainMod, "Print"),               cmd = "grimblast --notify --cursor copysave output" },
    { key = key("SHIFT", "Print"),               cmd = "grimblast --notify --cursor copy area" },
    { key = key(mainMod .. " + SHIFT", "Print"), cmd = "grimblast --notify --cursor edit area" },

    -- Scripts
    { key = key(mainMod, "N"),                   cmd = "~/.local/scripts/mount_nash.sh" },
    { key = key(mainMod .. " + SHIFT", "grave"), cmd = "hyprctl switchxkblayout all next" },
    { key = key(mainMod .. " + SHIFT", "B"),     cmd = "pkill waybar && waybar &" },
    {
        key = key(mainMod, "V"), -- clipboard history
        cmd = [[
            cliphist list |
            wofi --dmenu --pre-display-cmd "echo '%s' | cut -f 2" |
            cliphist decode |
            wl-copy
        ]]
    }
}

for _, bind in ipairs(app_binds) do
    hl.bind(bind.key, hl.dsp.exec_cmd(bind.cmd))
end


-- Laptop multimedia keys for volume and LCD brightness

local media_binds = {
    -- Volume
    { key = key(nil, "XF86AudioRaiseVolume"),  cmd = "changevolume up" },
    { key = key(nil, "XF86AudioLowerVolume"),  cmd = "changevolume down" },
    { key = key(nil, "XF86AudioMute"),         cmd = "changevolume mute" },

    -- Brightness
    { key = key(nil, "XF86MonBrightnessUp"),   cmd = "changebrightness up" },
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
    hl.bind(key(mainMod, k), hl.dsp.focus({ workspace = i }))
    hl.bind(key(mainMod .. " + SHIFT", k), hl.dsp.window.move({ workspace = i }))
end

-- Example special workspace (scratchpad)
hl.bind(key(mainMod, "S"), hl.dsp.workspace.toggle_special("magic"))
hl.bind(key(mainMod .. " + SHIFT", "S"), hl.dsp.window.move({ workspace = "special:magic" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
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
hl.bind(key(mainMod, "U"), hl.dsp.layout("togglesplit")) -- dwindle only
hl.bind(key(mainMod, "M"), hl.dsp.window.fullscreen_state({ internal = 1, client = 1, action = "toggle" }))
hl.bind(key(mainMod .. " + CONTROL", "M"),
    hl.dsp.window.fullscreen_state({ internal = 2, client = 2, action = "toggle" }))
hl.bind(key(mainMod .. " + SHIFT", "M"), hl.dsp.window.fullscreen_state({ internal = 0, client = 2, action = "toggle" }))
-- hl.bind(key(mainMod .. " + SHIFT + CONTROL", "M"), hl.dsp.window.fullscreen_state({ internal = 0, client = 0, action = "toggle" }))
--[[
hl.bind(
    key(mainMod .. " + SHIFT + CONTROL", "M"),
    hl.dsp.window.fullscreen_state({internal = 0, client = 0, action = "set"})
    -- hl.dsp.exec_cmd("notify-send test")
)
--]]

-- Session binds
hl.bind(key(mainMod .. " + SHIFT", "C"), hl.dsp.exit())
hl.bind(key(mainMod .. " + CONTROL", "Q"),
    hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'"))
hl.bind(key(mainMod .. " + CONTROL", "R"), hl.dsp.exec_cmd([[hyprshutdown -t 'Rebooting...' --post-cmd 'reboot']]))

-- Zoom
local zoom = require("scripts.zoom").zoom

local zoom_actions = {
    equal = "increase",
    ["mouse_down"] = "increase",
    minus = "decrease",
    ["mouse_up"] = "decrease",
    ["SHIFT + equal"] = "toggle",
    ["mouse:274"] = "toggle",
}

for k, action in pairs(zoom_actions) do
    hl.bind(
        key(mainMod, k),
        function()
            zoom(action)
        end,
        { repeating = true } -- TODO: remove this for toggle
    )
end

-- Zoom submap

hl.bind(key(mainMod, "Z"), hl.dsp.submap("zoom"))
hl.define_submap("zoom", function()
    local zoom_actions = {
        up = "increase",
        K = "increase",
        ["mouse:272"] = "increase",
        Q = "increase",
        down = "decrease",
        J = "decrease",
        ["mouse:273"] = "decrease",
        W = "decrease",
        E = "toggle",
        SPACE = "toggle",
    }

    -- Set repeating binds for zoom
    for k, action in pairs(zoom_actions) do
        hl.bind(k, function()
                zoom(action)
            end,
            { repeating = true }
        )
    end

    -- Use `reset` to go back to the global submap
    hl.bind("escape", hl.dsp.submap("reset"))
    hl.bind("Z", hl.dsp.submap("reset"))
    hl.bind(key(mainMod, "Z"), hl.dsp.submap("reset"))
end)


--[[
hl.bind(
    key(mainMod, "equal"),
    function ()
        zoom("increase")
    end,
    { repeating = true }
    -- hl.dsp.exec_cmd("zoom increase"), { repeating = true }
)

hl.bind(
    key(mainMod, "minus"),
    function ()
        zoom("decrease")
    end,
    { repeating = true }
    -- hl.dsp.exec_cmd("zoom decrease"), { repeating = true }
    )
hl.bind(key(mainMod .. " + SHIFT", "equal"), hl.dsp.exec_cmd("zoom reset"))
hl.bind(key(mainMod, "mouse_up"), hl.dsp.exec_cmd("zoom decrease"))
hl.bind(key(mainMod, "mouse_down"), hl.dsp.exec_cmd("zoom increase"))
hl.bind(key(mainMod, "mouse:274"), hl.dsp.exec_cmd("zoom reset"))
--]]

-- Switch binds
hl.bind("switch:on:ThinkPad Extra Buttons", hl.dsp.exec_cmd("auto_rotation.sh"), { locked = true })
hl.bind("switch:off:ThinkPad Extra Buttons", hl.dsp.exec_cmd("pkill -f auto_rotation.sh"), { locked = true })
hl.bind("switch:Lid Switch", hl.dsp.exec_cmd("hyprlock"), { locked = true })


-- To sort

-- Focus mode / battery optimisation with mod+X
hl.bind(
    key(mainMod, "X"),
    function()
        local game_mode = (hl.get_config("animations.enabled") == false)

        if game_mode then
            hl.exec_cmd("hyprctl reload")
            return
        end

        hl.config({
            general = {
                gaps_in = 0,
                gaps_out = 0, -- Disable gaps
                border_size = 1,
            },

            animations = {
                enabled = false, -- Disable animations
            },

            -- Disable blur, shadow and window rounding
            decoration = {
                shadow = { enabled = false },
                blur = { enabled = false },
                rounding = 0,
            }
        })
    end)
