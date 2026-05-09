-- Project-wide find/replace. Note: keymaps moved to <leader>S* namespace
-- to avoid conflicts with telescope's <leader>s* search keymaps.
return {
  "nvim-pack/nvim-spectre",
  dependencies = { "nvim-lua/plenary.nvim" },
  cmd = "Spectre",
  keys = {
    {
      "<leader>SS",
      function()
        require("spectre").toggle()
      end,
      desc = "Toggle Spectre",
    },
    {
      "<leader>Sw",
      function()
        require("spectre").open_visual({ select_word = true })
      end,
      desc = "Spectre: search word",
    },
    {
      "<leader>Sw",
      function()
        require("spectre").open_visual()
      end,
      mode = "v",
      desc = "Spectre: search selection",
    },
    {
      "<leader>Sf",
      function()
        require("spectre").open_file_search({ select_word = true })
      end,
      desc = "Spectre: search current file",
    },
  },
  opts = {},
}
