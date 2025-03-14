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
      colorscheme = "tokyonight-storm",
    },
  },
}
