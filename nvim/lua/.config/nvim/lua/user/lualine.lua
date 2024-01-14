vim.opt.showmode = false -- disabling showmode because lualine already shows the current mode
local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
  return
end

lualine.setup()
