return {
  {
    "fahmiauliarahman/json2go.nvim",
    ft = "go",
    config = function()
      require("json2go").setup()
    end,
    keys = {
      { "<leader>jg", "<cmd>Json2Go<cr>", desc = "JSON to Go struct (clipboard)" },
      { "<leader>js", "<cmd>Json2GoSelection<cr>", mode = "v", desc = "JSON to Go struct (selection)" },
    },
  },
}
