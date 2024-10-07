return {
  -- other plugins
  {
    "mattn/emmet-vim",
    config = function()
      -- Enable Emmet for specific file types
      vim.g.user_emmet_leader_key = "<C-Z>" -- Set leader key for emmet
      -- Enable Emmet for specific file types
      vim.cmd([[
        autocmd FileType html,css,javascriptreact,elixir,heex,eruby EmmetInstall
      ]])

      -- Optionally, if you're using Ruby on Rails ERB templates:
      vim.cmd([[
        autocmd FileType eruby EmmetInstall
      ]])
    end,
  },
}
