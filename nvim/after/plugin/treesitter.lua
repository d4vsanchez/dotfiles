require"nvim-treesitter.configs".setup {
  ensure_installer = { "c", "lua", "vim", "help", "query", "javascript", "typescript", "python" },

  sync_install = false,

  auto_install = true,

  highlight = {
    enable = true,

    additional_vim_regex_highlighting = false,
  }
}
