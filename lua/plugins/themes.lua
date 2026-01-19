return {
  -- 1) TokyoNight:
  {
    "folke/tokyonight.nvim",
    lazy = true, -- load immediately
    priority = 1000, -- load before other UI plugins
    opts = {
      style = "night", -- "storm", "moon", "night", "day"
      transparent = true,
    },
  },

  -- 2) (Optional) Catppuccin Mocha
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = true,
    priority = 1000,
    opts = {
      flavour = "mocha",
      transparent_background = true,
    },
  },

  -- 3) solarized-osaka
  {
    "craftzdog/solarized-osaka.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      terminal_colors = false,
    },
  },

  -- Tell LazyVim which one to use by default
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "tokyonight",
    },
  },
}
