local M = {
  HYPRLAND_TRACE = "1",

  XCURSOR_SIZE = "24",
  HYPRCURSOR_SIZE = "24",
  GDK_BACKEND = "wayland,x11,*",
  SDL_VIDEODRIVER = "wayland", -- used to be: "wayland,x11"
  CLUTTER_BACKEND = "wayland",

  XDG_CURRENT_DESKTOP = "Hyprland",
  XDG_SESSION_TYPE = "wayland",
  XDG_SESSION_DESKTOP = "Hyprland",

  QT_AUTO_SCREEN_SCALE_FACTOR = "1",
  QT_QPA_PLATFORM = "wayland;xcb",
  QT_WAYLAND_DISABLE_WINDOWDECORATION = "1",
  QT_QPA_PLATFORMTHEME = "qt5ct", -- # Tells Qt based applications to pick your theme from qt5ct, use with Kvantum. Change to qt6ct if you have that,

  -- # File association in dolphin.
  XDG_MENU_PREFIX = "arch-",

  -- # Electron apps (like Signal)
  ELECTRON_OZONE_PLATFORM_HINT = "auto",

  -- # toolkit-specific scale
  -- # env = GDK_SCALE,2
  -- # env = XCURSOR_SIZE,32
}

return M
