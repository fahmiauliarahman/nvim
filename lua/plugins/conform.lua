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
    end,
  },
}
