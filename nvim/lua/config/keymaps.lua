-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua

vim.keymap.set("n", "gf", "gF", { silent = true, desc = "Go to file" })

vim.o.hlsearch = true
vim.keymap.set("n", "<esc>", "<cmd>noh<cr><esc>", { silent = true, desc = "Clear search highlight" })
vim.keymap.set("n", "<leader>qc", "<cmd>call setqflist([])<CR>", { desc = "Clear quickfix list" })

-- Telescope live grep with args (lazy-loaded so this file doesn't break if telescope is removed)
vim.keymap.set("n", "<leader>fs", function()
  require("telescope").extensions.live_grep_args.live_grep_args()
end, { desc = "Live grep with args" })

-- Whitespace utilities
vim.keymap.set("n", "<leader>de", ":g/^$/d<CR>", { desc = "Delete empty lines" })
vim.keymap.set("n", "<leader>dw", ":g/^\\s*$/d<CR>", { desc = "Delete whitespace-only lines" })
vim.keymap.set("n", "<leader>dc", [[:%s/\n\n\+/\r/g<CR>]], { desc = "Condense blank lines" })
vim.keymap.set("n", "<leader>dt", [[:%s/\s\+$//e<CR>]], { desc = "Delete trailing whitespace" })
