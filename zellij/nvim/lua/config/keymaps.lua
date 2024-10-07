-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("n", "gf", "gF", { silent = true, desc = "Go to file" })

vim.o.hlsearch = true
vim.keymap.set("n", "<esc>", "<cmd>noh<cr><esc>", { silent = true, desc = "Go to file" })
