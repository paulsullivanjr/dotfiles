-- Linters that run alongside the LSP.
-- For Elixir: credo gives you style/refactor warnings the LSP doesn't.
-- Make sure credo is in your project's mix.exs deps.
return {
  "mfussenegger/nvim-lint",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local lint = require("lint")
    lint.linters_by_ft = {
      elixir = { "credo" },
    }

    -- Run linter on common events
    vim.api.nvim_create_autocmd({ "BufWritePost", "BufReadPost", "InsertLeave" }, {
      callback = function()
        require("lint").try_lint()
      end,
    })
  end,
}
