vim.g.mapleader = " "
vim.opt.backup = false
vim.opt.errorbells = false
vim.opt.swapfile = false
vim.opt.signcolumn = "yes"
vim.opt.relativenumber = true

-- Use spaces instead of tabs
vim.o.expandtab = true
vim.o.smartindent = true
vim.o.tabstop = 2
vim.o.shiftwidth = 2

-- Configure margins of Kitty on open/close
vim.api.nvim_create_autocmd({ "VimEnter" }, {
  callback = function()
    vim.cmd("silent !kitty @ --to=$KITTY_LISTEN_ON set-spacing margin=0")
  end,
})

vim.api.nvim_create_autocmd({ "VimLeave" }, {
  callback = function()
    vim.cmd("silent !kitty @ --to=$KITTY_LISTEN_ON set-spacing margin=15")
  end,
})
