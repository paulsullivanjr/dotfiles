return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    {
      "nvim-telescope/telescope-live-grep-args.nvim",
      -- This will not install any breaking changes.
      -- For major updates, this must be adjusted manually.
      version = "^1.0.0",
    },
  },
  requires = { { "nvim-lua/plenary.nvim" } },
  config = function()
    local telescope = require("telescope")

    telescope.setup({
      defaults = {
        vimgrep_arguments = {
          "rg",
          "--color=never",
          "--no-heading",
          "--with-filename",
          "--line-number",
          "--column",
          "--smart-case",
        },
        prompt_prefix = "> ",
        selection_caret = "> ",
        path_display = { "smart" },
        -- other options
      },
      pickers = {
        live_grep = {
          -- specific options for live_grep
        },
      },
    })

    telescope.load_extension("live_grep_args")

    -- Optionally, load any extensions you might be using
    -- telescope.load_extension("fzf")
    vim.keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", {})
    vim.keymap.set("n", "<leader>fw", "<cmd>Telescope grep_string<CR>", {})
    vim.keymap.set("n", "<leader><leader>", "<cmd>Telescope find_files<CR>", {})
    vim.keymap.set("n", "<leader>tq", "<cmd>Telescope send_to_qflist<CR>", {})

    vim.keymap.set("n", "<leader>tq", function()
      -- The function will be executed when you're in Telescope,
      -- so we can use vim.api.nvim_get_current_buf() to get the buffer number
      local bufnr = vim.api.nvim_get_current_buf()
      require("telescope.actions").send_to_qflist(bufnr)
      require("telescope.actions").open_qflist(bufnr)
    end, { desc = "Send Telescope results to quickfix list" })

    vim.keymap.set("n", "<leader>fa", function()
      require("telescope.builtin").find_files({
        prompt_title = "All Files",
        search_dirs = {
          vim.fn.getcwd(), -- Current project directory
          "~/obsidian", -- Replace with your actual Obsidian vault path
        },
      })
    end, { desc = "Find in project and Obsidian" })
  end,
}
