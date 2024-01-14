local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
  return
end

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics
-- local code_actions = null_ls.builtins.

-- sources
local sources = {
  -- formatters
  formatting.prettier.with {
    extra_filetypes = { "toml" },
    -- extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" },
  },
  formatting.stylua,
  -- formatting.shfmt, -- shell
  -- formatting.fixjson,
  -- formatting.black.with { extra_args = { "--fast" } }, -- python
  -- formatting.isort, -- python
  -- formatting.google_java_format,

  -- diagnostics
  diagnostics.selene, -- lua
  diagnostics.shellcheck.with {
    diagnostics_format = "#{m} [#{c}]",
  },
  -- diagnostics.write_good, -- markdown
  -- diagnostics.selene.with { 
  --   condition = function (utils)
  --     return utils.root_has_file("selene.toml")
  --   end,
  -- },
  -- diagnostics.flake8, -- python

  -- code actions
  null_ls.builtins.code_actions.gitsigns,
  null_ls.builtins.code_actions.gitrebase,

  -- hover
  null_ls.builtins.hover.dictionary,
}

-- https://github.com/prettier-solidity/prettier-plugin-solidity
null_ls.setup {
  debug = false,
  save_after_format = false,
  sources = sources,
}

-- Credits:
-- Neovim from scratch series: Chris@Machine
--
-- https://alpha2phi.medium.com/neovim-for-beginners-lsp-using-null-ls-nvim-bd954bf86b40
