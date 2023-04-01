vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])

vim.keymap.set("n", "<leader>e", ":Neotree toggle reveal<cr>")

local neotree = require("neo-tree")

neotree.setup({
  close_if_last_window = true,
  event_handlers = {

    -- Auto-close neotree if I open a file
    {
      event = "file_opened",
      handler = function()
        -- auto close
        neotree.close_all()
      end
    }

  }
})
