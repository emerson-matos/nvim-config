return {
  "mbbill/undotree",
  event = "VeryLazy",
  keys = {
    { "<leader>su", vim.cmd.UndotreeToggle, { desc = "UndotreeToggle", mode = { "n" } } },
    -- { "<leader>su",      function() Snacks.picker.undo() end,                                    desc = "Undo History" },
  },
}
