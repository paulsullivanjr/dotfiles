-- Snacks comes preconfigured with LazyVim. Only override what we want different.
-- All the picker/git/zen/scratch keymaps in the old file were already LazyVim defaults
-- and were fighting with telescope. Removing them.
return {
  "folke/snacks.nvim",
  opts = {
    -- Most modules below are already enabled by LazyVim; listed for clarity.
    bigfile = { enabled = true },
    dashboard = { enabled = true },
    indent = { enabled = true },
    input = { enabled = true },
    notifier = { enabled = true, timeout = 3000 },
    quickfile = { enabled = true },
    scope = { enabled = true },
    scroll = { enabled = true },
    statuscolumn = { enabled = true },
    words = { enabled = true },

    -- Disable snacks.picker since we use telescope (avoids keymap conflicts)
    picker = { enabled = false },
    -- Disable snacks.explorer since we use oil + neo-tree (LazyVim default)
    explorer = { enabled = false },
  },
}
