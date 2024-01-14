local options = {
  -- Line numbers:
  number = true,              -- Line numbers
  relativenumber = true,      -- Relative numbers

  -- Tabs and indentation:
  tabstop = 2,
  softtabstop = 2,
  shiftwidth = 2,
  expandtab = true,
  smartindent = true,

  -- ThePrimeagen options:
  exrc = true,                -- Sources project-specific vimrc's
  guicursor = "i:block",      -- Get block cursor in insert mode
  -- hidden = true,
  errorbells = false,         -- No annoying error sounds
  wrap = true,
  ignorecase = true,
  smartcase = true,           -- Case sensitive search when searching for capital letter. Otherwise case insensitive search. Requires ignorecase to be set
  undodir = "/home/ibra/.local/share/nvim/undo",
  undofile = true,
  incsearch = true,
  scrolloff = 8,              -- To start scrolling when the cursor is 8 lines above the last line in the current view
  -- colorcolumn = "80",
  -- With that, you might also want to do:
  -- highlight ColorColumn ctermbg=4 guibg=Red
  -- But put that line below the gruvbox colours configuration, or else it won't work for some reason.
  signcolumn = "yes",          -- Extra column to show error signs and whatnot

  shell = "/usr/bin/zsh",     -- Using zsh as default shell

  -- My extra options:
  mouse = "a",                -- Let's you use the mouse in every mode
  hlsearch = false,           -- To not highlight the results of previous search
  breakindent = true,         -- Broken lines will continue at the same indentation level as the original line
  syntax = "on",              -- Syntax highlighting
  writebackup = true,         -- Creates backup when writing file
  backup = false,             -- Deletes the backup after file successfully written

  -- Chris@Machine
  -- clipboard = "unnamedplus",            -- allows neovim to access the system clipboard
  cmdheight = 2,                           -- more space in the neovim command line for displaying messages
  completeopt = { "menuone", "noselect" }, -- mostly just for cmp
  conceallevel = 0,                        -- so that `` is visible in markdown files
  fileencoding = "utf-8",                  -- the encoding written to a file 
  pumheight = 10,                          -- pop up menu height
  -- showmode = false,                        -- we don't need to see things like -- INSERT -- anymore
  showtabline = 2,                         -- always show tabs
  splitbelow = true,                       -- force all horizontal splits to go below current window
  splitright = true,                       -- force all vertical splits to go to the right of current window
  -- swapfile = false,                        -- creates a swapfile
  termguicolors = true,                    -- set term gui colors (most terminals support this). See note at the bottom
  timeoutlen = 300,                        -- time to wait for a mapped sequence to complete (in milliseconds)
  updatetime = 300,                        -- faster completion (4000ms default)
  -- writebackup = false,                     -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
  cursorline = true,                       -- highlight the current line
  numberwidth = 4,                         -- set number column width to 2 {default 4}
  linebreak = true,                        -- companion to wrap, don't split words
  -- sidescrolloff = 8,                       -- minimal number of screen columns either side of cursor if wrap is `false`
  guifont = "monospace:h17",               -- the font used in graphical neovim applications
}

-- vim.opt.shortmess:append("c")    -- Don't give ins-completion-menu messages
-- vim.opt.whichwrap:append("<,>,[,],h,l")         -- keys allowed to move to the previous/next line when the beginning/end of line is reached
-- vim.opt.iskeyword:append("-")                   -- treats words with `-` as single words

for k, v in pairs(options) do
  -- vim.api.nvim_set_option(k, v)
  vim.opt[k] = v
end

-- Changing a vimscript global option:
vim.g.netrw_browse_split = 3 -- Netrw will open files in new tabs
vim.g.netrw_winsize = 30 -- Changing window size of netrw
-- "There are a lot of useful plugins written in vimscript. Most of them we can configure modifying global variables. In lua we change global variables of vimscript using vim.g." - Heiker



-- Extra info:
-- termguicolors:
-- "We enable termguicolors so Neovim can show the "best" version of the colorscheme. Each colorscheme can have two versions: one that works for terminals which only support 256 colors and another that specifies colors in hexadecimal codes (has way more colors)."

-- Credits:

-- Chris@Machine:
-- https://github.com/LunarVim/nvim-basic-ide
-- https://github.com/LunarVim/Neovim-from-scratch
-- https://yewtu.be/playlist?list=PLhoH5vyxr6Qq41NFL4GvhFp-WLd5xzIzZ

-- ThePrimeagen
-- https://yewtu.be/watch?v=DogKdiRx7ls&list=PLm323Lc7iSW9CtibHhhQErDh167XfL4EU&index=4

-- Heiker Curiel
-- https://vonheikemen.github.io/devlog/tools/build-your-first-lua-config-for-neovim/
