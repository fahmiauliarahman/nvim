-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Use pyright as main Python LSP (good with Django)
-- You can switch to "basedpyright" later if you want.
vim.g.lazyvim_python_lsp = "pyright"
vim.g.lazyvim_python_ruff = "ruff"

-- Allow Prettier even when there's no config file
-- (useful for quick JS/TS work in random repos).
vim.g.lazyvim_prettier_needs_config = false
