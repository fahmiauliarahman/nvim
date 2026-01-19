return {
  "hrsh7th/nvim-cmp",
  opts = function(_, opts)
    local cmp = require("cmp")

    opts.completion = { completeopt = "menu,menuone,noselect" }
    opts.experimental = vim.tbl_deep_extend("force", opts.experimental or {}, { ghost_text = false })

    opts.sources = cmp.config.sources(vim.list_extend(opts.sources or {}, {
      { name = "path" },
      { name = "buffer", keyword_length = 3 },
    }))

    opts.sorting = opts.sorting or {}
    opts.sorting.comparators = {
      cmp.config.compare.offset,
      cmp.config.compare.exact,
      cmp.config.compare.score,
      cmp.config.compare.recently_used,
      cmp.config.compare.kind,
      cmp.config.compare.sort_text,
      cmp.config.compare.length,
      cmp.config.compare.order,
    }
  end,
}
