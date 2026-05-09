-- render-markdown.nvim — best-in-class inline markdown rendering for nvim.
-- Renders headings, code blocks, tables, checkboxes, callouts, LaTeX, etc.
-- as you edit. Cursor's current line stays raw for editing.
return {
  "MeanderingProgrammer/render-markdown.nvim",
  ft = { "markdown", "Avante" }, -- Avante is the AI plugin chat buffer; harmless if not installed
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-mini/mini.icons",
  },
  keys = {
    { "<leader>um", "<cmd>RenderMarkdown toggle<cr>", desc = "Toggle markdown rendering" },
  },
  ---@module 'render-markdown'
  ---@type render.md.UserConfig
  opts = {
    -- File types to render in (default already includes markdown)
    file_types = { "markdown", "Avante" },

    -- Anti-conceal: when cursor is on a line, show raw markdown for that line
    -- so you can edit it. This is on by default; explicit for clarity.
    anti_conceal = { enabled = true },

    -- Headings: treat them like Notion/Obsidian — colored backgrounds + icons
    heading = {
      sign = false, -- no signs in the gutter (we use those for git)
      icons = { "󰲡 ", "󰲣 ", "󰲥 ", "󰲧 ", "󰲩 ", "󰲫 " },
      width = "block", -- background extends across the heading text only
      left_pad = 0,
      right_pad = 4,
    },

    -- Code blocks: highlighted background with language label
    code = {
      sign = false,
      width = "block", -- only as wide as the code, not full window
      right_pad = 4,
      border = "thick", -- "thin" | "thick" | "none"
      language_pad = 2,
      position = "right", -- where to show the language label
    },

    -- Bullets: nicer than ascii
    bullet = {
      icons = { "●", "○", "◆", "◇" }, -- nested list levels
    },

    -- Checkboxes: render [ ], [x], and custom states
    checkbox = {
      enabled = true,
      unchecked = { icon = "󰄱 ", highlight = "RenderMarkdownUnchecked" },
      checked = { icon = "󰄲 ", highlight = "RenderMarkdownChecked" },
      custom = {
        -- Obsidian-style task states: - [/] in progress, - [-] cancelled, etc.
        in_progress = { raw = "[/]", rendered = "󰥔 ", highlight = "RenderMarkdownTodo" },
        cancelled = { raw = "[-]", rendered = "󰜺 ", highlight = "RenderMarkdownError" },
        important = { raw = "[!]", rendered = " ", highlight = "RenderMarkdownWarn" },
        question = { raw = "[?]", rendered = " ", highlight = "RenderMarkdownInfo" },
      },
    },

    -- Quote blocks: > like this
    quote = {
      icon = "▌",
      repeat_linebreak = true, -- continue the bar on wrapped lines
    },

    -- Tables: properly aligned with separators
    pipe_table = {
      preset = "round", -- "none" | "round" | "double" | "heavy"
      style = "full", -- show full table styling
      cell = "padded",
    },

    -- Obsidian-style callouts: > [!note], > [!warning], etc.
    callout = {
      note = { raw = "[!NOTE]", rendered = "󰋽 Note", highlight = "RenderMarkdownInfo" },
      tip = { raw = "[!TIP]", rendered = "󰌶 Tip", highlight = "RenderMarkdownSuccess" },
      important = { raw = "[!IMPORTANT]", rendered = "󰅾 Important", highlight = "RenderMarkdownHint" },
      warning = { raw = "[!WARNING]", rendered = "󰀪 Warning", highlight = "RenderMarkdownWarn" },
      caution = { raw = "[!CAUTION]", rendered = "󰳦 Caution", highlight = "RenderMarkdownError" },
      -- Obsidian-specific
      abstract = { raw = "[!ABSTRACT]", rendered = "󰨸 Abstract", highlight = "RenderMarkdownInfo" },
      todo = { raw = "[!TODO]", rendered = "󰗡 Todo", highlight = "RenderMarkdownInfo" },
      success = { raw = "[!SUCCESS]", rendered = "󰄬 Success", highlight = "RenderMarkdownSuccess" },
      question = { raw = "[!QUESTION]", rendered = "󰘥 Question", highlight = "RenderMarkdownWarn" },
      failure = { raw = "[!FAILURE]", rendered = "󰅖 Failure", highlight = "RenderMarkdownError" },
      bug = { raw = "[!BUG]", rendered = "󰨰 Bug", highlight = "RenderMarkdownError" },
      example = { raw = "[!EXAMPLE]", rendered = "󰉹 Example", highlight = "RenderMarkdownHint" },
      quote = { raw = "[!QUOTE]", rendered = "󱆨 Quote", highlight = "RenderMarkdownQuote" },
    },

    -- Links: render [text](url) with cleaner display
    link = {
      enabled = true,
      image = "󰥶 ",
      email = "󰀓 ",
      hyperlink = "󰌹 ",
      wiki = { icon = "󱗖 ", highlight = "RenderMarkdownLink" }, -- [[wiki-links]] from Obsidian
    },

    -- LaTeX math: $...$ inline and $$...$$ blocks
    -- Requires `latex2text` (pip install pylatexenc) for full rendering
    latex = {
      enabled = true,
      converter = "latex2text",
      highlight = "RenderMarkdownMath",
    },

    -- Inline code: `like this` gets a subtle background
    -- (this is a sub-key of `code` in current versions; harmless if config schema differs)
  },
}
