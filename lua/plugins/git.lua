-- See `:help gitsigns` to understand what the configuration keys do
-- Adds git related signs to the gutter, as well as utilities for managing changes
return {
  'lewis6991/gitsigns.nvim',
  event = "BufRead",
  opts = {
    -- signs = {
    --   add          = { text = " " },
    --   change       = { text = " " },
    --   delete       = { text = " " },
    --   topdelete    = { text = " " },
    --   changedelete = { text = " " },
    --   untracked    = { text = " " },
    -- },
    -- signs_staged = {
    --   add          = { text = " " },
    --   change       = { text = " " },
    --   delete       = { text = " " },
    --   topdelete    = { text = " " },
    --   changedelete = { text = " " },
    --   untracked    = { text = " " },
    -- },
    signs_staged_enable = true,
    signcolumn = false, -- Toggle with `:Gitsigns toggle_signs`
    numhl = true,       -- Highlight numbers / Toggle with `:Gitsigns toggle_numhl`
    linehl = false,     -- Highlight lines / Toggle with `:Gitsigns toggle_linehl`
    watch_gitdir = {
      interval = 1000,
      follow_files = true,
    },
    attach_to_untracked = true,
    current_line_blame = true, -- Show git blame inline
    current_line_blame_opts = {
      virt_text = true,
      virt_text_pos = "eol",
      delay = 1000,
    },
    sign_priority = 6,
    update_debounce = 200,
    status_formatter = nil, -- Use default
  },
}
