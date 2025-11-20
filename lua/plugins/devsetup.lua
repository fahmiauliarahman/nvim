local function extend_unique(list, values)
  list = list or {}
  for _, value in ipairs(values) do
    if not vim.tbl_contains(list, value) then
      table.insert(list, value)
    end
  end
  return list
end

return {
  -- Treesitter parsers for all stacks
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      opts.ensure_installed = extend_unique(opts.ensure_installed, {
        "bash",
        "css",
        "go",
        "gomod",
        "gosum",
        "html",
        "javascript",
        "json",
        "lua",
        "markdown",
        "markdown_inline",
        "php",
        "python",
        "tsx",
        "typescript",
        "yaml",
      })
    end,
  },

  -- Installer defaults for LSPs/formatters/debuggers
  {
    "mason-org/mason.nvim",
    opts = function(_, opts)
      opts.ensure_installed = extend_unique(opts.ensure_installed, {
        -- python
        "pyright",
        "ruff",
        "black",
        "debugpy",
        -- go
        "gopls",
        "golangci-lint",
        "goimports",
        "delve",
        -- javascript/typescript
        "typescript-language-server",
        "eslint_d",
        "prettierd",
        "js-debug-adapter",
        -- php / laravel
        "intelephense",
        "phpactor",
        "php-debug-adapter",
        "blade-formatter",
        -- general
        "stylua",
      })
    end,
  },

  -- Guarantee DAP adapters across runtimes
  {
    "jay-babu/mason-nvim-dap.nvim",
    opts = function(_, opts)
      opts.ensure_installed = extend_unique(opts.ensure_installed, {
        "debugpy",
        "delve",
        "js-debug-adapter",
        "php-debug-adapter",
      })
    end,
  },

  -- Silence golangci-lint exit code noise when outside Go modules
  {
    "mfussenegger/nvim-lint",
    opts = function()
      local lint = require("lint")
      local linter = lint.linters.golangcilint
      if linter then
        linter.ignore_exitcode = true
      end
    end,
  },

  -- Custom Go debug launcher for non-standard main files
  {
    "leoluz/nvim-dap-go",
    opts = function(_, opts)
      opts = opts or {}
      opts.dap_configurations = opts.dap_configurations or {}
      table.insert(opts.dap_configurations, {
        type = "go",
        name = "Debug custom main",
        request = "launch",
        program = function()
          local default_path = vim.fn.getcwd() .. "/"
          local path = vim.fn.input("Go package (dir or main file): ", default_path, "file")
          if path == "" then
            return default_path
          end
          local stat = vim.loop.fs_stat(path)
          if stat and stat.type == "file" then
            return vim.fn.fnamemodify(path, ":h")
          end
          return path
        end,
      })
      return opts
    end,
  },

  -- Language servers & custom setups
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        intelephense = {
          settings = {
            intelephense = {
              files = { maxSize = 5000000 },
              format = { enable = true },
            },
          },
        },
        phpactor = {},
        emmet_language_server = {
          filetypes = { "blade", "html", "css", "javascriptreact", "typescriptreact", "php" },
        },
        tailwindcss = {
          filetypes = { "typescriptreact", "javascriptreact", "typescript", "javascript", "html", "php", "blade" },
        },
      },
    },
  },

  -- Laravel specific helpers
  {
    "adalessa/laravel.nvim",
    ft = { "php", "blade" },
    cmd = { "Artisan", "Laravel", "Sail", "Composer" },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
      "MunifTanjim/nui.nvim",
      "tpope/vim-dotenv",
    },
    opts = {
      ui = {
        border = "rounded",
      },
      features = {
        route_list = true,
        resource_builder = true,
      },
    },
    keys = {
      { "<leader>la", ":Artisan<CR>", desc = "Laravel Artisan" },
      { "<leader>lr", ":Laravel routes<CR>", desc = "Laravel Routes" },
    },
  },

  -- PHP debugging defaults
  {
    "mfussenegger/nvim-dap",
    config = function()
      local dap = require("dap")
      if not dap.adapters.php then
        dap.adapters.php = {
          type = "executable",
          command = "node",
          args = { vim.fn.stdpath("data") .. "/mason/packages/php-debug-adapter/extension/out/phpDebug.js" },
        }
      end
      dap.configurations.php = {
        {
          type = "php",
          request = "launch",
          name = "Listen for Xdebug",
          port = 9003,
          log = false,
          pathMappings = {
            ["/var/www/html"] = vim.loop.cwd(),
          },
        },
      }
    end,
  },
}
