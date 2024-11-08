return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    lazy = vim.fn.argc(-1) == 0,  -- load treesitter when loading a file from cmd
    init = function(plugin)
        require("lazy.core.loader").add_to_rtp(plugin)
        require("nvim-treesitter.query_predicates")
    end,
    cmd = { "TSUpdateSync", "TSUpdate", "TSInstall" },
    keys = {
        { "<c-space>", desc = "Increment selection" },
        { "<bs>", desc = "Decrement selection" },
    },
    opts_extend = { "ensure_installed" },
    opts = {
        highlight = { enable = true },
        indent = { enable = true },
        ensure_installed = {
            "bash",
            "html",
            "javascript",
            "jsdoc",
            "json",
            "jsonc",
            "lua",
            "markdown",
            "markdown_inline",
            "python",
            "sql",
            "tsx",
            "typescript",
            "vim",
            "vimdoc",
            "yaml",
        },
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = "<C-space>",
            node_incremental = "<C-space>",
            scope_incremental = false,
            node_decremental = "<bs>",
          },
        },
    },
    config = function(_, opts)
        require("nvim-treesitter.configs").setup(opts)
    end,
}
