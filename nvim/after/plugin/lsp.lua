local lsp = require("lsp-zero")
lsp.preset("recommended")

lsp.ensure_installed({
  -- Replace these with whatever servers you want to install
  "tsserver",
  "eslint",
  "sumneko_lua",
  "pyright",
})

lsp.on_attach(function (client, bufnr)
  local opts = { buffer = bufnr, remap = false }
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
  vim.keymap.set("n", "gh", vim.lsp.buf.hover, opts)
  vim.keymap.set("n", "<leader>vws", vim.lsp.buf.workspace_symbol, opts)
  vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, opts)
  vim.keymap.set("n", "<leader>n", vim.diagnostic.goto_next, opts)
  vim.keymap.set("n", "<leader>m", vim.diagnostic.goto_prev, opts)
  vim.keymap.set("n", "<leader>vca", vim.lsp.buf.code_action, opts)
  vim.keymap.set("n", "<leader>vrr", vim.lsp.buf.references, opts)
  vim.keymap.set("n", "<leader>vrn", vim.lsp.buf.rename, opts)
  vim.keymap.set("n", "<leader>sh", vim.lsp.buf.signature_help, opts)
end)

-- Configure lua language server for neovim
lsp.nvim_workspace()

lsp.setup()

vim.diagnostic.config({
  virtual_text = false,
})

vim.cmd('autocmd CursorHold * lua vim.diagnostic.open_float()')
vim.o.updatetime = 300
