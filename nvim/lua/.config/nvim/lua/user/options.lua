local options = {
    -- Line numbers:
    number = true,              -- Line numbers
    relativenumber = true,      -- Relative numbers
    
    -- Tabs and indentation:
    tabstop = 4,
    softtabstop = 4,
    shiftwidth = 4,
    expandtab = true,
    smartindent = true,

    -- ThePrimeagen options:
    exrc = true,                -- Sources project-specific vimrc's
    guicursor = "i:block",      -- Get block cursor in insert mode
    -- hidden = true,
    errorbells = false,         -- No annoying error sounds
    -- wrap = false,
    ignorecase = true,
    smartcase = true,           -- Case sensitive search when searching for capital letter. Otherwise case insensitive search. Requires ignorecase to be set
    undodir = "/home/ibra/.local/share/nvim/undo",
    undofile = true,
    incsearch = true,
    scrolloff = 8,              -- To start scrolling when the cursor is 8 lines above the last line in the current view
    colorcolumn = "80",
    -- With that, you might also want to do:
    -- highlight ColorColumn ctermbg=4 guibg=Red
    -- But put that line below the gruvbox colours configuration, or else it won't work for some reason.
    signcolumn = "yes",          -- Extra column to show error signs and whatnot

    shell = "/usr/bin/zsh",     -- Using zsh as default shell
}

for k, v in pairs(options) do
    -- vim.api.nvim_set_option(k, v)
    vim.opt[k] = v
end
