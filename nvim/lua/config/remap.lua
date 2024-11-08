local map = vim.keymap.set

map("n", "<leader>fl", vim.cmd.Ex)

-- Move between panes
map("n", "<C-h>", "<C-w>h", { desc = "Go to left pane", remap = true })
map("n", "<C-j>", "<C-w>j", { desc = "Go to bottom pane", remap = true })
map("n", "<C-k>", "<C-w>k", { desc = "Go to top pane", remap = true })
map("n", "<C-l>", "<C-w>l", { desc = "Go to right pane", remap = true })

-- Resize panes
map("n", "<C-r>k", function()
    return "<cmd>resize +" .. (vim.v.count or 2) .. "<cr>"
end, { desc = "Increase pane height", remap = true, expr = true })
map("n", "<C-r>j", function()
    return "<cmd>resize -" .. (vim.v.count or 2) .. "<cr>"
end, { desc = "Decrease pane height", remap = true, expr = true })
map("n", "<C-r>h", function() 
    return "<cmd>vertical resize -" .. (vim.v.count or 2) .. "<cr>"
end, { desc = "Decrease pane width", remap = true, expr = true })
map("n", "<C-r>l", function()
    return "<cmd>vertical resize +" .. (vim.v.count or 2) .. "<cr>"
end, { desc = "Increase pane width", remap = true, expr = true })

-- Buffers
map("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "Go to previous buffer" })
map("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Go to next buffer" })
map("n", "<leader>bd", "<cmd>bdelete<cr>", { desc = "Kill current buffer" })

-- New file
map("n", "<leader>fn", "<cmd>enew<cr>", { desc = "New file" })
