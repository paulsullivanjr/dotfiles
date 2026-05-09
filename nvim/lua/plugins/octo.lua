-- GitHub integration: read/review/comment on PRs and issues without leaving nvim.
-- Requires the `gh` CLI installed and authenticated (`gh auth login`).
return {
  "pwntester/octo.nvim",
  cmd = "Octo",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
    "nvim-tree/nvim-web-devicons",
  },
  keys = {
    { "<leader>gop", "<cmd>Octo pr list<cr>", desc = "Octo: list PRs" },
    { "<leader>goP", "<cmd>Octo pr create<cr>", desc = "Octo: create PR" },
    { "<leader>goi", "<cmd>Octo issue list<cr>", desc = "Octo: list issues" },
    { "<leader>gor", "<cmd>Octo review start<cr>", desc = "Octo: start PR review" },
    { "<leader>goR", "<cmd>Octo review submit<cr>", desc = "Octo: submit review" },
    { "<leader>goc", "<cmd>Octo pr checkout<cr>", desc = "Octo: checkout PR locally" },
  },
  opts = {
    enable_builtin = true,
    default_to_projects_v2 = true,
    default_merge_method = "squash",
    picker = "telescope",
    suppress_missing_scope = {
      projects_v2 = true,
    },
  },
}
