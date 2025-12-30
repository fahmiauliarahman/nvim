return {
  {
    "mfussenegger/nvim-dap-python",
    dependencies = {
      "mfussenegger/nvim-dap",
      "mason-org/mason.nvim",
    },
    ft = "python", -- Load when opening python files
    config = function()
      -- Locate debugpy via Mason
      local mason_path = vim.fn.stdpath("data") .. "/mason/packages/debugpy/venv/bin/python"
      
      -- Setup dap-python
      require("dap-python").setup(mason_path)

      -- Custom Configurations for FastAPI and Django
      local dap = require("dap")
      
      -- Ensure configs table exists
      dap.configurations.python = dap.configurations.python or {}

      -- Django: Run server
      table.insert(dap.configurations.python, {
        type = "python",
        request = "launch",
        name = "Django: Run server",
        program = vim.fn.getcwd() .. "/manage.py",
        args = { "runserver" },
        django = true,
        justMyCode = true,
      })

      -- Django: Run Test
      table.insert(dap.configurations.python, {
        type = "python",
        request = "launch",
        name = "Django: Run Test",
        program = vim.fn.getcwd() .. "/manage.py",
        args = { "test" },
        django = true,
        justMyCode = true,
      })

      -- FastAPI: Run app
      table.insert(dap.configurations.python, {
        type = "python",
        request = "launch",
        name = "FastAPI: Run app",
        module = "uvicorn",
        args = { "main:app", "--reload", "--port", "8000" },
        pythonPath = function()
          local cwd = vim.fn.getcwd()
          if vim.fn.executable(cwd .. "/.venv/bin/python") == 1 then
            return cwd .. "/.venv/bin/python"
          elseif vim.fn.executable(cwd .. "/venv/bin/python") == 1 then
            return cwd .. "/venv/bin/python"
          else
            return "/usr/bin/python3" -- Fallback
          end
        end,
      })
    end,
  },
}
