return {
  {
    "stevearc/conform.nvim",
    opts = function(_, opts)
      -- 1) Be less aggressive with timeouts (helps Black & other heavy tools)
      -- opts.default_format_opts = opts.default_format_opts or {}
      -- opts.default_format_opts.timeout_ms = 10000 -- 10s, tweak if you like

      -- 2) Prefer Ruff for Python (fast, Black-like formatting)
      -- opts.formatters_by_ft = opts.formatters_by_ft or {}
      -- opts.formatters_by_ft.python = { "ruff_format" }

      -- If you really prefer “Ruff when available, else Black”, comment the line above
      -- and use this instead:
      --
      opts.formatters_by_ft.python = {
        "ruff_organize_imports",
        "ruff_format",
      }

       -- PHP/Laravel: use Pint (Laravel's official formatter) or php_cs_fixer as fallback
       opts.formatters_by_ft.php = { "pint", "php_cs_fixer" }
       opts.formatters_by_ft.blade = { "blade-formatter", "prettier" }

      opts.formatters = opts.formatters or {}
      opts.formatters.prettier = opts.formatters.prettier or {}
      opts.formatters.prettier.prepend_args = vim.list_extend(
        opts.formatters.prettier.prepend_args or {},
        { "--print-width", "140", "--single-attribute-per-line", "false" }
      )
      opts.formatters.prettierd = opts.formatters.prettierd or {}
      opts.formatters.prettierd.prepend_args = vim.list_extend(
        opts.formatters.prettierd.prepend_args or {},
        { "--print-width", "140", "--single-attribute-per-line", "false" }
      )
    end,
  },
}
