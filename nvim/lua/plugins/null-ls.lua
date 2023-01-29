return {
  {
    "jose-elias-alvarez/null-ls.nvim",
    event = "BufReadPre",
    dependencies = { "mason.nvim" },
    opts = function()
      local nls = require("null-ls")
      local formatters = nls.builtins.formatting
      return {
        sources = {
          formatters.prettierd,
        },
      }
    end,
  },
}
