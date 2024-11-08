vim.opt.clipboard = vim.env.SSH_TTY and "" or "unnamedplus"  -- sync with the system's clipboard
vim.opt.expandtab = true  -- use spaces instad of tabs
vim.opt.tabstop = 4  -- number of spaces a tab accounts for
vim.opt.shiftwidth = 4  -- size of an indent
vim.opt.smartindent = true  -- insert indents automatically
vim.opt.wrap = false  -- disable line wrap
vim.opt.ignorecase = true  -- search ignoring case
vim.opt.number = true  -- print line number
vim.opt.relativenumber = true  -- use relative line numbers

vim.opt.hlsearch = false  -- do not highlight search
vim.opt.incsearch = true  -- enable incremental search

vim.opt.scrolloff = 8  -- number of lines in context
vim.opt.signcolumn = "yes"  -- always show the sign column, prevent text shifting when getting active

vim.opt.colorcolumn = "80"  -- add a column at 80 chars
vim.opt.termguicolors = true

vim.opt.undofile = true
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.backup = false
vim.opt.swapfile = false
vim.opt.updatetime = 50
