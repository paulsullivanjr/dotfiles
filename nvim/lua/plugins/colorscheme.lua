return {
  -- Primary colorscheme (loads at startup since LazyVim sets it as default)
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    priority = 1000,
    opts = {},
  },

  -- Secondary - lazy loaded only when invoked
  {
    "folke/tokyonight.nvim",
    lazy = true,
  },

  -- Tell LazyVim which colorscheme to use
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin-macchiato",
    },
  },
}
