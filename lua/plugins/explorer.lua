return {
  -- turn off neo-tree
  { "nvim-neo-tree/neo-tree.nvim", enabled = false },

  -- Snacks explorer as the sidebar (show hidden + gitignored by default)
  {
    "folke/snacks.nvim",
    opts = function(_, opts)
      opts = opts or {}
      opts.explorer = opts.explorer or {}
      opts.picker = opts.picker or {}
      opts.picker.sources = opts.picker.sources or {}
      opts.picker.sources.explorer = vim.tbl_deep_extend("force", opts.picker.sources.explorer or {}, {
        hidden = false,
        ignored = true,
      })
      return opts
    end,
    keys = {
      {
        "<leader>fe",
        function()
          Snacks.explorer({ cwd = LazyVim.root(), hidden = false, ignored = true })
        end,
        desc = "Explorer Snacks (root dir)",
      },
      {
        "<leader>fE",
        function()
          Snacks.explorer({ hidden = false, ignored = true })
        end,
        desc = "Explorer Snacks (cwd)",
      },
      { "<leader>e", "<leader>fe", desc = "Explorer Snacks (root dir)", remap = true },
      { "<leader>E", "<leader>fE", desc = "Explorer Snacks (cwd)", remap = true },
    },
  },
}
