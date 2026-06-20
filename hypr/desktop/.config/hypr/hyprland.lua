-- Refer to the wiki for more information.
-- https://wiki.hypr.land/Configuring/Start/

-- Requires
require("config.monitors")

local env = require("config.env")
for name, value in pairs(env) do
    hl.env(name, value)
end

require("config.autostart")

local g = require("config.globals")


-----------------------
----- PERMISSIONS -----
-----------------------

-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Permissions/
-- Please note permission changes here require a Hyprland restart and are not applied on-the-fly
-- for security reasons

hl.config({
    ecosystem = {
        enforce_permissions = true,
    },
})

hl.permission({
    binary = "/usr/(lib|libexec|lib64)/xdg-desktop-portal-hyprland",
    type = "screencopy",
    mode = "allow"
})
-- hl.permission("/usr/(bin|local/bin)/grim", "screencopy", "allow")
-- hl.permission("/usr/(lib|libexec|lib64)/xdg-desktop-portal-hyprland", "screencopy", "allow")
-- hl.permission("/usr/(bin|local/bin)/hyprpm", "plugin", "allow")


-----------------------
---- LOOK AND FEEL ----
-----------------------

-- Refer to https://wiki.hypr.land/Configuring/Basics/Variables/
local opts = require("config.options")
hl.config(opts)

-- Animations
require("config.animations")

---------------
---- INPUT ----
---------------

require("config.input")

---------------------
---- KEYBINDINGS ----
---------------------

require("config.keybinds")

--------------------------------
---- WINDOWS AND WORKSPACES ----
--------------------------------

require("config.windows")
