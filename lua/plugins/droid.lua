return {
  "fahmiauliarahman/droid.nvim",
  dependencies = { "folke/snacks.nvim" },
  config = function()
    ---@type droid.Opts
    vim.g.droid_opts = {
      provider = {
        enabled = "snacks",
        snacks = {
          auto_close = false,
          win = {
            position = "right",
          },
        },
      },
    }

    vim.o.autoread = true

    vim.keymap.set({ "n", "x" }, "<leader>aa", function()
      require("droid").ask("@this: ", { submit = true })
    end, { desc = "Ask Droid" })

    vim.keymap.set({ "n", "x" }, "<leader>as", function()
      require("droid").select()
    end, { desc = "Droid actions" })

    vim.keymap.set({ "n", "t" }, "<leader>at", function()
      require("droid").toggle()
    end, { desc = "Toggle Droid" })

    vim.keymap.set({ "n", "x" }, "<leader>ao", function()
      return require("droid").operator("@this ")
    end, { expr = true, desc = "Add range to Droid" })

    vim.keymap.set("n", "<leader>aO", function()
      return require("droid").operator("@this ") .. "_"
    end, { expr = true, desc = "Add line to Droid" })
  end,
}
