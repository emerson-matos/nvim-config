return {
  {
    "nvim-telescope/telescope.nvim",
    opts = {extensions = { fzf = {} }},
    event = "VeryLazy",
    keys = {
      {
        "<leader>,",
        function() require("telescope.builtin").buffers({sort_mru=true, sort_lastused=true}) end,
        desc = "Switch Buffer",
      },
      {
        "<leader>fh",
        function() require("telescope.builtin").help_tags() end,
        desc = "Switch Buffer",
      },

      {
        "<leader>/",
        function()
          require("telescope.builtin").live_grep()
        end,
        desc = "Grep (Root Dir)",
      },
      {
        "<leader>:",
        function()
          require("telescope.builtin").command_history()
        end,
        desc = "Command History",
      },
      {
        "<leader><space>",
        function()
          require("telescope.builtin").find_files()
        end,
        desc = "Find Files (Root Dir)",
      },
    },
    dependencies = { "nvim-lua/plenary.nvim", {"nvim-telescope/telescope-fzf-native.nvim", build = "make"}},
  },
}
