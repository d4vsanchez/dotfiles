local opts = { noremap = true, silent = true }

vim.keymap.set("n", "<leader>V", ":vsplit<CR>", opts)
vim.keymap.set("n", "<leader>H", ":split<CR>", opts)

-- Clear search highlight
vim.keymap.set("n", "<leader>h", ":noh<return><esc>", opts)

-- Modify split screen navigation
vim.keymap.set("n", "<C-h>", "<C-w>h", opts)
vim.keymap.set("n", "<C-k>", "<C-w>k", opts)
vim.keymap.set("n", "<C-j>", "<C-w>j", opts)
vim.keymap.set("n", "<C-l>", "<C-w>l", opts)

-- Modify buffer management
vim.keymap.set("n", "<leader>x", ":bd<CR>", opts)
vim.keymap.set("n", "<C-S-h>", ":bprevious<CR>", opts)
vim.keymap.set("n", "<C-S-l>", ":bnext<CR>", opts)

