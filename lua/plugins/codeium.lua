return {
  "Exafunction/codeium.vim",
  event = "InsertEnter",
  init = function()
    vim.g.codeium_disable_bindings = 1
    vim.g.codeium_manual = 0
  end,
  keys = {
    {
      "<C-l>",
      function()
        return vim.fn["codeium#Accept"]()
      end,
      expr = true,
      silent = true,
      mode = "i",
      desc = "Accept Codeium suggestion",
    },
    {
      "<C-x>",
      function()
        return vim.fn["codeium#Clear"]()
      end,
      expr = true,
      silent = true,
      mode = "i",
      desc = "Clear Codeium suggestion",
    },
  },
}
