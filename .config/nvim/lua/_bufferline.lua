require "bufferline".setup {
    options = {
        left_trunc_marker = "",
        right_trunc_marker = "",
        view = "multiwindow",
        separator_style = "padded_slant",
        max_name_length = 14,
        max_prefix_length = 13,
        tab_size = 14,
        enforce_regular_tabs = false,
        diagnostics = 'coc',
        offsets = {{
            filetype = "NvimTree", 
            text = "File Explorer",
            highlight = "Directory",
        }}
    },
}


local opt = {silent = true}

vim.api.nvim_set_keymap("n", "<S-l>", [[<Cmd>BufferLineCycleNext<CR>]], opt)
vim.api.nvim_set_keymap("n", "<S-h>", [[<Cmd>BufferLineCyclePrev<CR>]], opt)
vim.api.nvim_set_keymap("n", "<C-w>", [[<Cmd>bdelete<CR>]], opt)
