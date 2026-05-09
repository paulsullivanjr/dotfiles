-- Git stack:
--   gitsigns  - inline gutter signs, hunk staging, line blame (LazyVim default)
--   lazygit   - TUI for branch/stash/rebase ops (LazyVim default via snacks)
--   diffview  - proper diff viewer + 3-way merge conflict resolution
--
-- These are complementary, not overlapping. Each owns a distinct workflow.

return {
  -- Lazygit keymap (LazyVim default already maps <leader>gg, this is here
  -- so it's documented in one place alongside the other git tools)
  {
    "folke/snacks.nvim",
    keys = {
      {
        "<leader>gg",
        function()
          Snacks.lazygit()
        end,
        desc = "Lazygit",
      },
    },
  },

  -- Diffview: 2-way and 3-way diffs, file history, merge tool
  {
    "sindrets/diffview.nvim",
    cmd = {
      "DiffviewOpen",
      "DiffviewClose",
      "DiffviewFileHistory",
      "DiffviewToggleFiles",
      "DiffviewFocusFiles",
    },
    keys = {
      { "<leader>gdo", "<cmd>DiffviewOpen<cr>", desc = "Diffview: open (working tree vs HEAD)" },
      { "<leader>gdc", "<cmd>DiffviewClose<cr>", desc = "Diffview: close" },
      { "<leader>gdh", "<cmd>DiffviewFileHistory<cr>", desc = "Diffview: branch history" },
      { "<leader>gdf", "<cmd>DiffviewFileHistory %<cr>", desc = "Diffview: current file history" },
      { "<leader>gdm", "<cmd>DiffviewOpen<cr>", desc = "Diffview: resolve merge conflicts" },
    },
    opts = {
      enhanced_diff_hl = true, -- nicer highlights for word-level diffs
      view = {
        merge_tool = {
          layout = "diff3_mixed", -- 3-pane: OURS | BASE | THEIRS for merge conflicts
          disable_diagnostics = true,
        },
      },
      file_panel = {
        listing_style = "tree",
      },
    },
  },

  -- Optional: extend gitsigns config beyond LazyVim's defaults
  -- (LazyVim already enables it, this just turns on always-visible line blame)
  {
    "lewis6991/gitsigns.nvim",
    opts = {
      current_line_blame = false, -- toggle on demand with :Gitsigns toggle_current_line_blame
      current_line_blame_opts = {
        delay = 500,
        virt_text_pos = "eol",
      },
    },
  },
}
