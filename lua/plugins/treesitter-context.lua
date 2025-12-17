return {
  "nvim-treesitter/nvim-treesitter-context",
  event = "LazyFile",
  opts = {
    mode = "cursor", -- Line used to calculate context. Choices: 'cursor', 'topline'
    max_lines = 3, -- How many lines the window should span. Values <= 0 mean no limit.
  },
}
