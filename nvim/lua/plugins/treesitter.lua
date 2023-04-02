return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "bash",
        "javascript",
        "json",
        "python",
        "typescript",
        "vim",
      },

      highlight = {
        enable = true,

        additional_vim_regex_highlighting = false,
      },
    },
  },
}
