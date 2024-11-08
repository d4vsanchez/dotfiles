return {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    keys = {
        {
            "<leader>fb",
            "<cmd>Telescope buffers sort_mru=true sort_lastused=true<cr>",
            desc = "Switch buffer",
        },
        {
            "<leader>fg",
            "<cmd>Telescope live_grep<cr>",
            desc = "Search within files",
        },
        {
            "<leader>ff",
            "<cmd>Telescope find_files<cr>",
            desc = "Find files",
        },
    },    
}
