-- vim.cmd("colorscheme aurora")

-- local colorscheme = "aurora"
-- local colorscheme = "darkplus"
local colorscheme = "onedark"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  return
end
