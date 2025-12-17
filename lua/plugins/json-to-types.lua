return {
  "Redoxahmii/json-to-types.nvim",
  build = "sh install.sh npm", -- Uses npm to install the underlying CLI tool
  keys = {
    {
      "<leader>cJ",
      "<CMD>ConvertJSONtoLang typescript<CR>",
      desc = "Convert JSON to TypeScript Interfaces",
    },
    {
      "<leader>cg",
      "<CMD>ConvertJSONtoLang go<CR>",
      desc = "Convert JSON to Go Structs",
    },
    -- You can add other languages supported by the plugin here
  },
}
