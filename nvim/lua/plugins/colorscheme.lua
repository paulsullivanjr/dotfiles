--return {
--  "folke/tokyonight.nvim",
--  lazy = false,
--  priority = 1000,
--  opts = { style = "storm" },
--  config = function()
--    vim.cmd([[colorscheme tokyonight-storm]])
--  end,
--}

return {
  { "Mofiqul/vscode.nvim", lazy = false },
  { "Mofiqul/dracula.nvim", lazy = false },
  { "folke/tokyonight.nvim", lazy = false },
  { "rebelot/kanagawa.nvim", lazy = false },
  { "thesimonho/kanagawa-paper.nvim", lazy = false },
  { "neanias/everforest-nvim", lazy = false },
  { "kihachi2000/yash.nvim", lazy = false },
  { "savq/melange-nvim", lazy = false },
  { "ribru17/bamboo.nvim", lazy = false },
  {
    "catppuccin/nvim",
    lazy = false,
    name = "catppuccin",
    config = function()
      require("catppuccin").setup({
        -- configurations
      })
    end,
    opts = {},
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin-macchiato",
    },
  },
}
