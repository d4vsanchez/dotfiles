return {
    "folke/trouble.nvim",
    dependencies = {"nvim-tree/nvim-web-devicons"},
    event = {'BufReadPre', 'BufNewFile'},
    config = function()
        local trouble = require('trouble')
        vim.keymap.set("n", "<leader>el", function() trouble.toggle("document_diagnostics") end)
    end,
}
