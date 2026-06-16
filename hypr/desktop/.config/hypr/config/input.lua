local opts = {
    input = {
        kb_layout  = "us,us,ara,be",
        kb_variant = ",intl,mac,",
        kb_model   = "",
        kb_options = "caps:swapescape,altwin:menu_win,grp:lctrl_lshift_toggle,lv3:lalt_switch",
        kb_rules   = "",

        follow_mouse = 1,

        sensitivity = 0, -- -1.0 - 1.0, 0 means no modification. Try 0.2
        -- accel_profile = "flat",
        -- float_switch_override_focus = 2,

        touchpad = {
            natural_scroll = false,
        },
    },
    
    gestures = {
        -- # workspace_swipe = true
        -- # workspace_swipe_fingers = 3
        workspace_swipe_cancel_ratio = 0.15,
        workspace_swipe_touch = true,
        workspace_swipe_invert = true,
    },
}

hl.config(opts)

-- Per-device config
-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Devices/ for more
hl.device({
    name = "ELAN Touchscreen",
    enabled = false,
})