return {
  "folke/persistence.nvim",
  event = "BufReadPre", -- this will only start session saving when an actual file was opened
  opts = {
    -- add any custom options here
  },
  keys = {
    { "<leader>qs", function() require("persistence").load() end,                desc = "Load the session for the current directory" },
    { "<leader>qS", function() require("persistence").select() end,              desc = "Select a session to load" },
    { "<leader>ql", function() require("persistence").load({ last = true }) end, desc = "Restore Last Session" },
    { "<leader>qd", function() require("persistence").stop() end,                desc = "Don't Save Current Session" },
  },
}
