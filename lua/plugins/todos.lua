-- PERF something
-- perf something
-- HACK: something
-- hack something
-- TODO something
-- todo something
-- NOTE something
-- note something
-- FIX something
-- fix something
-- FIXME something
-- fixme something
-- WARNING something
-- warning something

return {
  "folke/todo-comments.nvim",
  event = "BufReadPost",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local todo_comments = require("todo-comments")
    vim.keymap.set("n", "<Leader>fT", "<Cmd>TodoTelescope<CR>", { desc = "Find TODOs" })
    -- TODO add better comments
    -- todo set something
    vim.keymap.set("n", "]T", function()
      todo_comments.jump_next()
    end, { desc = "Next TODO comment" })
    vim.keymap.set("n", "[T", function()
      todo_comments.jump_prev()
    end, { desc = "Previous TODO comment" })

    todo_comments.setup({
      signs = true,      -- show icons in the signs column
      sign_priority = 8, -- sign priority
      keywords = {
        FIX = {
          icon = " ", -- icon used for the sign, and in search results
          color = "error", -- can be a hex color, or a named color (see below)
          alt = { "FIXME", "BUG", "FIXIT", "ISSUE", "fix", "fixme", "bug", "fixit", "issue" }, -- a set of other keywords that all map to this FIX keywords
          -- signs = false, -- configure signs for some keywords individually
        },
        TODO = { icon = " ", color = "info", alt = { "todo" } },
        HACK = { icon = " ", color = "warning", alt = { "hack" } },
        WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX", "warn", "warning", "xxx" } },
        PERF = {
          icon = " ",
          alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE", "perf", "optim", "performance", "optimize" },
        },
        NOTE = { icon = " ", color = "hint", alt = { "INFO", "note", "info" } },
        TEST = {
          icon = "⏲ ",
          color = "test",
          alt = { "TESTING", "PASSED", "FAILED", "test", "testing", "passed", "failed" },
        },
      },
      gui_style = {
        fg = "NONE",         -- The gui style to use for the fg highlight group.
        bg = "BOLD",         -- The gui style to use for the bg highlight group.
      },
      merge_keywords = true, -- when true, custom keywords will be merged with the defaults
      -- highlighting of the line containing the KEYWORD comment
      -- * before: highlights before the keyword (typically comment characters)
      -- * keyword: highlights of the keyword
      -- * after: highlights after the keyword (keyword text)
      highlight = {
        multiline = false,                -- enable multine KEYWORD comments
        multiline_pattern = "^.",         -- lua pattern to match the next multiline from the start of the matched keyword
        multiline_context = 10,           -- extra lines that will be re-evaluated when changing a line
        before = "bg",                    -- "fg" or "bg" or empty
        keyword = "wide_bg",              -- "fg", "bg", "wide", "wide_bg", "wide_fg" or empty. (wide and wide_bg is the same as bg, but will also highlight surrounding characters, wide_fg acts accordingly but with fg)
        after = "bg",                     -- "fg" or "bg" or empty
        pattern = [[\C.*<(KEYWORDS)\s*]], -- pattern or table of patterns, used for highlighting (vim regex)
        comments_only = true,             -- uses treesitter to match keywords in comments only
        max_line_len = 400,               -- ignore lines longer than this
        exclude = {},                     -- list of file types to exclude highlighting
      },
      -- list of named colors where we try to extract the guifg from the
      -- list of highlight groups or use the hex color if hl not found as a fallback
      colors = {
        error = { "DiagnosticError", "ErrorMsg", "#DC2626" },
        warning = { "DiagnosticWarn", "WarningMsg", "#FBBF24" },
        info = { "DiagnosticInfo", "#2563EB" },
        hint = { "DiagnosticHint", "#10B981" },
        default = { "Identifier", "#7C3AED" },
        test = { "Identifier", "#FF00FF" },
      },
      search = {
        command = "rg",
        args = {
          "--color=never",
          "--no-heading",
          "--with-filename",
          "--line-number",
          "--column",
        },
        pattern = [[\b(KEYWORDS)]], -- ripgrep regex
      },
    })
  end,
}
