return {
  {
    'ellisonleao/gruvbox.nvim',
    opts = {},
  },

  {
    "rose-pine/neovim",
    name = "rose-pine",
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
