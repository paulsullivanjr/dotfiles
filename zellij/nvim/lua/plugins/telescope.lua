-- ~/.config/nvim/lua/plugins/telescope.lua

return {
  "nvim-telescope/telescope.nvim",
  requires = { { "nvim-lua/plenary.nvim" } },
  config = function()
    local telescope = require("telescope")

    telescope.setup({
      defaults = {
        vimgrep_arguments = {
          "rg",
          "--color=never",
          "--no-heading",
          "--with-filename",
          "--line-number",
          "--column",
          "--smart-case",
        },
        prompt_prefix = "> ",
        selection_caret = "> ",
        path_display = { "smart" },
        -- other options
      },
      pickers = {
        live_grep = {
          -- specific options for live_grep
        },
      },
    })

    -- Optionally, load any extensions you might be using
    telescope.load_extension("fzf")
    vim.keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", {})
    vim.keymap.set("n", "<leader>fw", "<cmd>Telescope grep_string<CR>", {})
  end,
}
