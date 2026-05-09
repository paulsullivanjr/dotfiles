-- Obsidian integration with daily notes, search, and quick-capture.
return {
  "epwalsh/obsidian.nvim",
  version = "*",
  ft = "markdown",
  cmd = {
    "ObsidianOpen",
    "ObsidianNew",
    "ObsidianToday",
    "ObsidianYesterday",
    "ObsidianTomorrow",
    "ObsidianSearch",
    "ObsidianQuickSwitch",
    "ObsidianTemplate",
  },
  keys = {
    { "<leader>oo", "<cmd>ObsidianOpen<cr>", desc = "Obsidian: open in app" },
    { "<leader>on", "<cmd>ObsidianNew<cr>", desc = "Obsidian: new note" },
    { "<leader>od", "<cmd>ObsidianToday<cr>", desc = "Obsidian: today's note" },
    { "<leader>oy", "<cmd>ObsidianYesterday<cr>", desc = "Obsidian: yesterday's note" },
    { "<leader>oT", "<cmd>ObsidianTomorrow<cr>", desc = "Obsidian: tomorrow's note" },
    { "<leader>os", "<cmd>ObsidianSearch<cr>", desc = "Obsidian: search vault" },
    { "<leader>oq", "<cmd>ObsidianQuickSwitch<cr>", desc = "Obsidian: quick switch" },
    { "<leader>ot", "<cmd>ObsidianTemplate<cr>", desc = "Obsidian: insert template" },
    { "<leader>ob", "<cmd>ObsidianBacklinks<cr>", desc = "Obsidian: backlinks" },
    { "<leader>ol", "<cmd>ObsidianLinks<cr>", desc = "Obsidian: outgoing links" },
  },
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = {
    workspaces = {
      {
        name = "personal",
        path = "/Users/paulsullivan/obsidian", -- typo fixed (was "obisidian")
      },
    },
    daily_notes = {
      folder = "daily", -- create this folder in your vault, or change as needed
      date_format = "%Y-%m-%d",
      default_tags = { "daily" },
    },
    completion = {
      nvim_cmp = false, -- you use blink.cmp instead
      min_chars = 2,
    },
    new_notes_location = "current_dir",
    -- Use mappings inside the obsidian buffer (leave default ones plus ours)
    mappings = {
      ["gf"] = {
        action = function()
          return require("obsidian").util.gf_passthrough()
        end,
        opts = { noremap = false, expr = true, buffer = true },
      },
      ["<cr>"] = {
        action = function()
          return require("obsidian").util.smart_action()
        end,
        opts = { buffer = true, expr = true },
      },
    },
    ui = {
      enable = false, -- let render-markdown.nvim handle the rendering
    },
  },
}
