vim.g.mapleader = " "
vim.keymap.set("n", "-", vim.cmd.Ex)

-- Use spaces instead of tabs
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = -1  -- If negative, it uses the shiftwidth value
vim.opt.shiftround = true
vim.opt.expandtab = true

-- Keep 8 lines above and below the cursor
vim.opt.scrolloff = 8

-- Show numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Use the system clipboard as primary
vim.opt.clipboard = 'unnamedplus'

-- Case insensitive search
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Remove backup
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.undofile = false
vim.opt.swapfile = false

-- Remember 1000 items in command line history
vim.opt.history = 1000

