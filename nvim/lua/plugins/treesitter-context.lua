-- Pins the enclosing function/module/etc. signature at top of window when scrolling.
-- Hugely useful in long Phoenix controllers, GenServers, large modules.
return {
  "nvim-treesitter/nvim-treesitter-context",
  event = "BufReadPost",
  opts = {
    max_lines = 3, -- don't take up too much screen
    min_window_height = 20, -- skip on small splits
    multiline_threshold = 1, -- only show one line per context for clarity
    trim_scope = "outer",
  },
  keys = {
    {
      "<leader>uC",
      function()
        require("treesitter-context").toggle()
      end,
      desc = "Toggle treesitter context",
    },
  },
}
