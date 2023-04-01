local opts = { noremap = true, silent = true }

vim.keymap.set("n", "<esc>", ":noh<return><esc>", opts)
vim.keymap.set("n", "<leader>w", ":w<cr>", opts)
vim.keymap.set("n", "<leader>q", ":q<cr>", opts)

-- Move between panes
vim.keymap.set("n", "<C-h>", "<C-w>h", opts)
vim.keymap.set("n", "<C-j>", "<C-w>j", opts)
vim.keymap.set("n", "<C-k>", "<C-w>k", opts)
vim.keymap.set("n", "<C-l>", "<C-w>l", opts)

-- Move between buffers
vim.keymap.set("n", "<S-h>", ":bprev<cr>", opts)
vim.keymap.set("n", "<S-l>", ":bnext<cr>", opts)
