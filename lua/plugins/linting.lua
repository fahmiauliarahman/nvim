return {
  {
    "mfussenegger/nvim-lint",
    opts = function(_, opts)
      local lint = require("lint")
      local golangcilint = lint.linters.golangcilint
      if golangcilint then
        golangcilint.ignore_exitcode = true
      end
    end,
  },
}
