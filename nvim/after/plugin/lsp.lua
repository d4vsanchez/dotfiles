require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = {
    -- Python
    "pyright", -- "mypy", "flake8", "pylint", "isort", "black",
    -- JavaScript
    "tsserver",
    -- Lua (for neovim config mostly)
    "lua_ls",
  },

  automatic_installation = true,
})

local lsp = require('lsp-zero').preset({})
lsp.on_attach(function(client, bufnr)
  lsp.default_keymaps({buffer = bufnr})
  vim.keymap.set("n", "<leader>vrn", vim.lsp.buf.rename, { buffer = bufnr, remap = false })
end)

require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

lsp.setup()
