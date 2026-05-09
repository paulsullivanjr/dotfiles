return {
  "stevearc/oil.nvim",
  cmd = "Oil",
  keys = {
    { "-", "<cmd>Oil<cr>", desc = "Open parent directory (oil)" },
  },
  dependencies = { { "nvim-mini/mini.icons", opts = {} } },
  ---@module 'oil'
  ---@type oil.SetupOpts
  opts = {},
}
