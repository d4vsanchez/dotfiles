-- Modify the keymaps for navigating between panes
vim.keymap.set("n", "<C-h>", "<C-w>h", {noremap=true})
vim.keymap.set("n", "<C-l>", "<C-w>l", {noremap=true})
vim.keymap.set("n", "<C-j>", "<C-w>j", {noremap=true})
vim.keymap.set("n", "<C-k>", "<C-w>k", {noremap=true})

-- Keymaps for pane creation
vim.keymap.set("n", "<leader>sh", vim.cmd.split)
vim.keymap.set("n", "<leader>sv", vim.cmd.vsplit)

-- Keymaps for buffers
vim.keymap.set("n", "<leader>bd", vim.cmd.bdelete)
vim.keymap.set("n", "<S-h>", vim.cmd.bprev)
vim.keymap.set("n", "<S-l>", vim.cmd.bnext)

