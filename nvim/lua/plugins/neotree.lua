return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    keys = {
      { "<leader>e", "<cmd>Neotree focus reveal toggle<cr>", desc = "Open tree finder" },
    },
    opts = {
      event_handlers = {

        -- Auto-close Neotree if I open a file
        {
          event = "file_opened",
          handler = function()
            require("neo-tree").close_all()
          end,
        },
      },
    },
  },
}
