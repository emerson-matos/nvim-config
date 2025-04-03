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
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    opts = {
      background = { -- :h background
        light = "latte",
        dark = "mocha",
      },
      transparent_background = true, -- disables setting the background color.
      term_colors = true,
      integrations = {
        blink_cmp = true,
        noice = true,
        notify = true,
        snacks = { enabled = true },
        which_key = true
      }
    },
    config = function(_, opts)
      require("catppuccin").setup(opts)
      vim.cmd.colorscheme("catppuccin-frappe")
    end,
  },
  {
    "dracula/vim",
    name = "dracula",
    lazy = false,
    opts = {},
    config = function()
      -- vim.cmd.colorscheme("dracula")
      vim.g.dracula_colorterm = 0
    end,
  },
}
