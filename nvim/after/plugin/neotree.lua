require("neo-tree").setup({
  event_handlers = {
    {
      event = "file_opened",
      handler = function()
        require("neo-tree").close_all()
      end
    }
  }
})
