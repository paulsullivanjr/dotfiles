-- REPL integration: send code from buffer to IEx for evaluation.
-- Workflow: <leader>rs starts REPL, then <leader>rl sends current line, etc.
return {
  "Vigemus/iron.nvim",
  cmd = { "IronRepl", "IronAttach", "IronFocus" },
  keys = {
    { "<leader>rs", "<cmd>IronRepl<cr>", desc = "REPL: start" },
    { "<leader>rr", "<cmd>IronRestart<cr>", desc = "REPL: restart" },
    { "<leader>rf", "<cmd>IronFocus<cr>", desc = "REPL: focus window" },
    { "<leader>rh", "<cmd>IronHide<cr>", desc = "REPL: hide window" },
    -- The send keys (<leader>sc, <leader>sl etc) are configured by iron itself
    -- via keymaps below.
  },
  config = function()
    local iron = require("iron.core")
    local view = require("iron.view")

    iron.setup({
      config = {
        scratch_repl = true,
        repl_definition = {
          elixir = {
            command = function(meta)
              -- Use `iex -S mix` if there's a mix.exs, plain iex otherwise
              local cwd = vim.fn.getcwd()
              if vim.fn.filereadable(cwd .. "/mix.exs") == 1 then
                return { "iex", "-S", "mix" }
              else
                return { "iex" }
              end
            end,
            format = require("iron.fts.common").bracketed_paste_python,
          },
        },
        repl_open_cmd = view.split.vertical.botright(0.4),
      },
      keymaps = {
        toggle_repl = "<leader>rt",
        send_motion = "<leader>sc",
        visual_send = "<leader>sc",
        send_file = "<leader>sf",
        send_line = "<leader>sl",
        send_paragraph = "<leader>sp",
        send_until_cursor = "<leader>su",
        send_mark = "<leader>sm",
        cr = "<leader>s<cr>",
        interrupt = "<leader>s<space>",
        exit = "<leader>sq",
        clear = "<leader>cl",
      },
      highlight = { italic = true },
      ignore_blank_lines = true,
    })
  end,
}
