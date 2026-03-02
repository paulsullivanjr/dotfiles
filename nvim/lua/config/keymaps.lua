-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
vim.keymap.set("n", "gf", "gF", { silent = true, desc = "Go to file" })

vim.o.hlsearch = true
vim.keymap.set("n", "<esc>", "<cmd>noh<cr><esc>", { silent = true, desc = "Go to file" })
vim.keymap.set("n", "<leader>qc", "<cmd>call setqflist([])<CR>", { desc = "Clear quickfix list" })
vim.keymap.set("n", "<leader>fs", require("telescope").extensions.live_grep_args.live_grep_args, { noremap = true })

-- Delete all empty lines
vim.keymap.set("n", "<leader>de", ":g/^$/d<CR>", { desc = "Delete empty lines" })

-- Delete lines with only whitespace
vim.keymap.set("n", "<leader>dw", ":g/^\\s*$/d<CR>", { desc = "Delete whitespace-only lines" })

-- Condense multiple blank lines to single blank line
vim.keymap.set("n", "<leader>dc", [[:%s/\n\n\+/\r/g<CR>]], { desc = "Condense blank lines" })

-- Remove trailing whitespace (manual trigger)
vim.keymap.set("n", "<leader>dt", [[:%s/\s\+$//e<CR>]], { desc = "Delete trailing whitespace" })
