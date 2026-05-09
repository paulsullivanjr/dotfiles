return {
  "nvim-telescope/telescope.nvim",
  cmd = "Telescope",
  dependencies = {
    "nvim-lua/plenary.nvim",
    {
      "nvim-telescope/telescope-live-grep-args.nvim",
      version = "^1.0.0",
    },
  },
  keys = {
    { "<leader>fg", "<cmd>Telescope live_grep<CR>", desc = "Live grep" },
    { "<leader>fw", "<cmd>Telescope grep_string<CR>", desc = "Grep word under cursor" },
    { "<leader><leader>", "<cmd>Telescope find_files<CR>", desc = "Find files" },
    {
      "<leader>fa",
      function()
        require("telescope.builtin").find_files({
          prompt_title = "Project + Obsidian",
          search_dirs = { vim.fn.getcwd(), "~/obsidian" },
        })
      end,
      desc = "Find in project and Obsidian",
    },
    {
      "<leader>tq",
      function()
        local bufnr = vim.api.nvim_get_current_buf()
        require("telescope.actions").send_to_qflist(bufnr)
        require("telescope.actions").open_qflist(bufnr)
      end,
      desc = "Send results to quickfix",
    },
  },
  opts = {
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
    },
  },
  config = function(_, opts)
    local telescope = require("telescope")
    telescope.setup(opts)
    telescope.load_extension("live_grep_args")
  end,
}
