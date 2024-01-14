-- Explanation of syntax at the bottom of the document

-- Shorten function name
local keymap = vim.keymap.set
-- Silent keymap option
local opts = { silent = false } -- set this to true, if you want silent option
-- Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "

-- normal mode keybinds:
keymap("n", "<leader>w", "<cmd>write<cr>") -- Save current document with <leader> + w
keymap("n", "<leader>c", '"+yy') -- `<leader>c` will copy whole line to clipboard
keymap("n", "<leader>v", '"+p')  -- `<leader>v` will paste from clipboard
keymap("n", "<leader>d", "<cmd>delete+<cr>") -- Delete current line and store it in clipboard (basically cut)
keymap("n", "<leader>fp", "mn[s1z=`n") -- Fix previous spelling error and return to the position where you are
-- TODO: write function for it
-- -- Better window navigation
keymap("n", "<C-h>", "<C-w>h")
keymap("n", "<C-j>", "<C-w>j")
keymap("n", "<C-k>", "<C-w>k")
keymap("n", "<C-l>", "<C-w>l")
-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)
-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)
keymap("n", "<leader>q", ":Bdelete<CR>", opts)
-- Navigate tabs
-- keymap("n", "<S-l>", ":tabn<CR>", opts)
-- keymap("n", "<S-h>", ":tabp<CR>", opts)
-- Clear highlights
keymap("n", "<leader>h", "<cmd>nohlsearch<CR>", opts) -- Clear highlights

-- insert and visual modes binds:
keymap("v", "<leader>c", '"+y') -- Visual mode: `<leader>c` will copy to clipboard
-- keymap("i", "<leader>v", '<C-r>+') -- Insert mode: `<leader>v` will paste from clipboard

-- Plugins

-- Telescope
keymap("n", "<leader>ff", ":Telescope find_files<CR>")
keymap("n", "<leader>ft", ":Telescope live_grep<CR>")
keymap("n", "<leader>fp", ":Telescope projects<CR>")
keymap("n", "<leader>fb", ":Telescope buffers<CR>")

-- Git signs
keymap("n", "<leader>gh", ":Gitsigns preview_hunk<CR>", opts)
keymap("n", "<leader>bl", ":Gitsigns blame_line<CR>", opts)

-- NvimTree
keymap("n", "<leader>e", ":NvimTreeToggle<CR>", opts)


-- Syntax:
-- vim.keymap.set({mode}, {lhs}, {rhs}, {opts})

-- {mode} can be a string or a table of strings:
--    n: normal_mode
--    i: insert_mode
--    x: visual_mode
--    s: selection_mode
--    v: visual_mode + selection_mode
--    t: term_mode
--    c: command_mode
--    o: Operator-pending
--    '': Yes, an empty string. Is the equivalent of n + v + o


--    {lhs} is the key we want to bind.

--    {rhs} is the action we want to execute. It can be a string with a command or an expression. You can also provide a lua function.

--    {opts} this must be a lua table. It can have these properties:
        -- desc: A string that describes what the keybinding does. You can write anything you want.
        -- remap: A boolean that determines if our keybinding can be recursive. The default value is false. Recursive keybindings can cause some conflicts if used incorrectly. Don't enable it unless you know what you're doing.
        -- buffer: It can be a boolean or a number. If we assign the boolean true it means the keybinding will only be effective in the current file. If we assign a number, it needs to be the "id" of an open buffer.
        -- silent: A boolean. Determines whether or not the keybindings can show a message. The default value is false.
        -- expr: A boolean. If enabled it gives the chance to use vimscript or lua to calculate the value of {rhs}. The default value is false.

-- References: 
-- https://vonheikemen.github.io/devlog/tools/build-your-first-lua-config-for-neovim/
-- https://github.com/LunarVim/nvim-basic-ide/blob/master/lua/user/keymaps.lua
