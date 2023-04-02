return {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "stylua",
        "shfmt",
        "flake8",
        "pyright",
        "typescript-language-server",
        "deno",
        "black",
        "isort",
        "rust-analyzer",
        "eslint_d",
        "prettierd",
      },
    },
  },
}
