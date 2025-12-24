return {
  "folke/snacks.nvim",
  opts = {
    -- Required for droid.nvim
    input = {},
    terminal = {},

    -- Explorer side bar
    explorer = {
      enabled = true,
      hidden = true, -- show dotfiles like .env, .gitignore
      ignored = true, -- keep respecting .gitignore (your original setting)
      -- keep noisy dirs hidden
      exclude = {
        "**/.git",
        "**/.svn",
        "**/.hg",
        "**/.DS_Store",
        "**/.idea",
        "**/.venv",
        "**/node_modules",
        "**/dist",
        "**/build",
      },
    },

    -- Pickers (files, grep, etc.)
    picker = {
      sources = {
        files = {
          hidden = true, -- show dotfiles in file picker
          ignored = true, -- keep your original choice: include gitignored here
          exclude = {
            "**/.git",
            "**/.svn",
            "**/.hg",
            "**/.DS_Store",
            "**/.idea",
            "**/.venv",
            "**/node_modules",
            "**/dist",
            "**/build",
          },
        },
        grep = {
          hidden = true, -- allow searching in dotfiles
          ignored = true, -- still respect .gitignore for grep (your original)
        },
        explorer = {
          hidden = true,
          ignored = true,
          exclude = {
            "**/.git",
            "**/.svn",
            "**/.hg",
            "**/.DS_Store",
            "**/.idea",
            "**/.venv",
            "**/node_modules",
            "**/dist",
            "**/build",
          },
        },
      },
    },
  },
}
