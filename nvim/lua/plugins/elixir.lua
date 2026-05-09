-- Elixir setup using elixir-ls.
--
-- Note on Expert (the new official LSP merging Lexical + Next LS): as of early
-- 2026, Expert has known issues with Erlang/OTP 28 — it crashes with
-- {:erpc, :noconnection} on init because of how it spins up a separate project
-- node. See https://github.com/elixir-lang/expert/issues/181 and #59.
-- Revisit Expert in 6+ months. For now elixir-ls is the stable choice.

return {
  -- Configure elixir-ls as the LSP, disable Expert until OTP 28 support lands
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        elixirls = {
          settings = {
            elixirLS = {
              -- Dialyzer is slow; enable per-project if you want it
              dialyzerEnabled = false,
              -- Don't auto-fetch deps on every save
              fetchDeps = false,
              -- Test lenses (CodeLens above each test to run it inline)
              enableTestLenses = false,
              -- Suggest @spec annotations
              suggestSpecs = false,
            },
          },
        },
        expert = { enabled = false },
        nextls = { enabled = false },
        lexical = { enabled = false },
      },
    },
  },

  -- Format Elixir with `mix format` via conform (already in LazyVim)
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        elixir = { "mix" },
        eelixir = { "mix" },
        heex = { "mix" },
      },
    },
  },

  -- Projectionist: jump between lib<->test, controller<->view, etc.
  -- Phoenix conventions are recognized; per-project overrides via .projections.json
  {
    "tpope/vim-projectionist",
    ft = { "elixir", "eelixir", "heex" },
    init = function()
      vim.g.projectionist_heuristics = {
        ["mix.exs"] = {
          ["lib/*.ex"] = {
            type = "source",
            alternate = "test/{}_test.exs",
          },
          ["test/*_test.exs"] = {
            type = "test",
            alternate = "lib/{}.ex",
          },
        },
      }
    end,
    keys = {
      { "<leader>aa", "<cmd>A<cr>", desc = "Alternate file (lib<->test)" },
      { "<leader>av", "<cmd>AV<cr>", desc = "Alternate in vsplit" },
      { "<leader>as", "<cmd>AS<cr>", desc = "Alternate in split" },
    },
  },
}
