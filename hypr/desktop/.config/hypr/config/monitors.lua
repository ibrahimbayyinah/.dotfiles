local monitors = {
    builtIn = {
        output = "eDP-1",
        mode = "preferred",
        position = "auto",
        scale = "auto",
    },

    thinkVision = {
        output = "DVI-I-1",
        mode = "1600x900",
        position = "auto",
        scale = "auto",
    },

    default = {
        output = "",
        mode = "preferred",
        position = "auto",
        scale = "1", -- maybe try "auto" if there are issues
    }
}

--[[
# monitor=HDMI-A-2,1920x1080@74.99,auto,auto,transform,0
# monitor=HDMI-A-2,1920x1080@74.99,auto,auto,transform,0,mirror,eDP-1
# monitor=HDMI-A-2,preferred,auto,1
# monitor=HDMI-A-1,preferred,auto,1
# monitor=DVI-I-1,1280x1024@75.03,auto,auto,transform,0
# monitor=DP-4,1440x900@119.85,auto,auto,transform,0
# monitor=DP-4,1920x1080,auto,1,transform,0
# monitor=DP-5,1920x1080,auto,1,transform,0
--]]

for name, monitor in pairs(monitors) do
    hl.monitor(monitor)
end
