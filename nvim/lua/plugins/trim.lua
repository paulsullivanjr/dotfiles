-- Auto-trim trailing whitespace on save.
-- Note: overlaps with the manual <leader>dt keymap in keymaps.lua, but that's fine
-- as a manual fallback for cases where you don't want to save.
return {
  "cappyzawa/trim.nvim",
  event = "BufWritePre",
  opts = {},
}
