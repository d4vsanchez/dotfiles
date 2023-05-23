local opts = { noremap = true, silent = true }

-- Pane creation
vim.keymap.set("n", "<leader>|", ":split<cr>", opts)
vim.keymap.set("n", "<leader>-", ":vsplit<cr>", opts)

-- Pane navigation
vim.keymap.set("n", "<C-h>", "<C-w>h", opts)
vim.keymap.set("n", "<C-l>", "<C-w>l", opts)
vim.keymap.set("n", "<C-j>", "<C-w>j", opts)
vim.keymap.set("n", "<C-k>", "<C-k>k", opts)

-- Buffer navigation
vim.keymap.set("n", "<C-S-h>", ":bprevious<cr>", opts)
vim.keymap.set("n", "<C-S-l>", ":bnext<cr>", opts)

vim.keymap.set("n", "<leader>q", ":q<cr>", opts)
vim.keymap.set("n", "<leader>bd", ":bd<cr>", opts)

-- Clear search highlight
vim.keymap.set("n", "<esc>", ":noh<return><esc>", opts)

-- Neotree
vim.keymap.set("n", "<leader>e", ":NeoTreeFocusToggle<cr>", { noremap = true, silent = true })
