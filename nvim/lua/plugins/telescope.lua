return {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = { 
        "nvim-lua/plenary.nvim"
    },
    config = function()
        local builtin = require("telescope.builtin")
        local utils = require("telescope.utils")
        vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
        vim.keymap.set("n", "<leader>fs", builtin.live_grep, {})
        vim.keymap.set("n", "<leader>lb", builtin.buffers, {})
    end
}
