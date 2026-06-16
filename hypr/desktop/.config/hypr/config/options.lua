local M = {
    general = {
        gaps_in  = 2,
        gaps_out = 5,

        border_size = 2,

        col = {
            active_border   = { colors = {"rgba(33ccffee)", "rgba(00ff99ee)"}, angle = 45 },
            inactive_border = "rgba(595959aa)",
        },

        -- Set to true to enable resizing windows by clicking and dragging on borders and gaps
        resize_on_border = true,

        -- Please see https://wiki.hypr.land/Configuring/Advanced-and-Cool/Tearing/ before you turn this on
        allow_tearing = false,

        layout = "scrolling",
    },
    
    decoration = {
        rounding       = 10,
        rounding_power = 2,

        -- Change transparency of focused and unfocused windows
        active_opacity   = 1.0,
        -- inactive_opacity = 0.8,

        shadow = {
            enabled      = false,
            --[[
            range        = 4,
            render_power = 3,
            color        = 0xee1a1a1a,
            --]]
        },

        blur = {
            enabled   = false,
            --[[
            size      = 3,
            passes    = 1,
            vibrancy  = 0.1696,
            --]]
        },
        
        dim_inactive = true,
        -- dim_strength = 0.1,
    },
    
    animations = {
        enabled = true,
    },
    
    misc = {
        force_default_wallpaper = -1,    -- Set to 0 or 1 to disable the anime mascot wallpapers
        disable_hyprland_logo   = false, -- If true disables the random hyprland logo / anime girl background. :(
        disable_splash_rendering = true,
        enable_swallow = true,
        animate_manual_resizes = false,
    },

    -- See https://wiki.hypr.land/Configuring/Layouts/Dwindle-Layout/ for more
    dwindle = {
        preserve_split = true, -- You probably want this
    },

    -- See https://wiki.hypr.land/Configuring/Layouts/Master-Layout/ for more
    master = {
        new_status = "master",
    },

    -- See https://wiki.hypr.land/Configuring/Layouts/Scrolling-Layout/ for more
    scrolling = {
        fullscreen_on_one_column = true,
    },
    
    cursor = {
        zoom_factor = 1.0,
        zoom_rigid = true,
    },
    
    binds = {
        workspace_back_and_forth = true,
        allow_workspace_cycles = false,
        -- scroll_event_delay = 10,
    },
}

return M