return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      pyright = {
        before_init = function(_, config)
          local cwd = vim.fn.getcwd()
          local venv = cwd .. "/.venv"
          if vim.fn.isdirectory(venv) == 1 then
            config.settings = config.settings or {}
            config.settings.python = config.settings.python or {}
            config.settings.python.venvPath = cwd
            config.settings.python.pythonPath = venv .. "/bin/python"
          end
        end,
      },
    },
  },
}
