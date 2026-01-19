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

local function patch_lazyvim_treesitter()
  local ok, ts = pcall(require, "lazyvim.util.treesitter")
  if not ok then
    return
  end

  ts.have_query = function(lang, query)
    local key = lang .. ":" .. query
    if ts._queries[key] == nil then
      local ok_q, res = pcall(vim.treesitter.query.get, lang, query)
      ts._queries[key] = ok_q and res ~= nil or false
    end
    return ts._queries[key]
  end
end

patch_lazyvim_treesitter()
vim.api.nvim_create_autocmd("User", {
  pattern = "LazyVimStarted",
  callback = patch_lazyvim_treesitter,
})
