return {
  -- "nvim-treesitter/nvim-treesitter",
  -- build = ":TSUpdate",
  -- event = { "BufReadPre", "BufNewFile" },
  -- cmd = { "TSUpadateSync", "TSUpdate", "TSInstall" },
  -- dependencies = { "windwp/nvim-ts-autotag", "nvim-treesitter/nvim-treesitter-context" },
  -- auto_install = true,
  -- ---@type TSConfig
  -- ---@diagnostic disable-next-line: missing-fields
  -- opts = {
  --   highlight = { enable = true },
  --   indent = { enable = true },
  --   auto_install = true,
  --   autotag = { enable = true },
  --   incremental_selection = {
  --     enable = true,
  --     keymaps = {
  --       init_selection = "<C-space>",
  --       node_incremental = "<C-space>",
  --       scope_incremental = false,
  --       node_decremental = "<bs>",
  --     },
  --   },
  --   textobjects = {
  --     move = {
  --       enable = true,
  --       goto_next_start = { ["]f"] = "@function.outer", ["]c"] = "@class.outer", ["]a"] = "@parameter.inner" },
  --       goto_next_end = { ["]F"] = "@function.outer", ["]C"] = "@class.outer", ["]A"] = "@parameter.inner" },
  --       goto_previous_start = { ["[f"] = "@function.outer", ["[c"] = "@class.outer", ["[a"] = "@parameter.inner" },
  --       goto_previous_end = { ["[F"] = "@function.outer", ["[C"] = "@class.outer", ["[A"] = "@parameter.inner" },
  --     },
  --   },
  -- },
  -- ---@param opts TSConfig
  -- config = function(_, opts)
  --   require("nvim-treesitter.configs").setup(opts)
  -- end,
}
