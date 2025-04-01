return {
  {
    'ellisonleao/gruvbox.nvim',
    opts = {
      transparent_mode = true
    },
  },
  {
    "rose-pine/neovim",
    name = "rose-pine",
    opts = {
      disable_background = true,
    },
  },
  {
    "folke/tokyonight.nvim",
    opts = {
      transparent = true,
      styles = {
        sidebars = "transparent",
        floats = "transparent",
      },
    },
    -- lazy = false,
    -- config = function()
    --   vim.cmd.colorscheme("tokyonight")
    -- end,
  },
  {
    "dracula/vim",
    name = "dracula",
    lazy = false,
    opts = {},
    config = function()
      vim.cmd.colorscheme("dracula")
      vim.g.dracula_colorterm = 0
    end,
  },
}
