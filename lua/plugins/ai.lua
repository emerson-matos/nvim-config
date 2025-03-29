return {
  -- {
  --   "olimorris/codecompanion.nvim",
  --   dependencies = {
  --     "nvim-lua/plenary.nvim",
  --     "nvim-treesitter/nvim-treesitter",
  --   },
  --   config = true,
  --   lazy = false,
  --   keys = {
  --     {
  --       "<leader>a",
  --       "<cmd>CodeCompanionActions<cr>",
  --       mode = "n",
  --       noremap = true,
  --       silent = true,
  --     },
  --     {
  --       "<leader>a",
  --       "<cmd>CodeCompanionActions<cr>",
  --       mode = "v",
  --       noremap = true,
  --       silent = true,
  --     },
  --     {
  --       "ga",
  --       "<cmd>CodeCompanionChat Add<cr>",
  --       mode = "v",
  --       noremap = true,
  --       silent = true,
  --     },
  --   },
  --   opts = {
  --     strategies = {
  --       chat = {
  --         adapter = "ollama",
  --       },
  --       inline = {
  --         adapter = "ollama",
  --       },
  --       agent = {
  --         adapter = "ollama",
  --       },
  --     },
  --     adapters = {
  --       ollama = function()
  --         return require("codecompanion.adapters").extend("ollama", {
  --           schema = {
  --             model = {
  --               default = "deepseek-r1:14b",
  --             },
  --             num_ctx = {
  --               default = 4096,
  --             },
  --           },
  --         })
  --       end,
  --     },
  --   },
  -- },
  {
    "yetone/avante.nvim",
    event = "VeryLazy",
    version = false, -- Never set this value to "*"! Never!
    opts = {
      -- add any opts here
      -- for example
      provider = "ollama",
      ollama = {
        model = "qwen2.5-coder:14b",
      }
    },
    -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
    build = "make",
    -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "stevearc/dressing.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      --- The below dependencies are optional,
      -- "echasnovski/mini.pick", -- for file_selector provider mini.pick
      -- "nvim-telescope/telescope.nvim", -- for file_selector provider telescope
      "hrsh7th/nvim-cmp", -- autocompletion for avante commands and mentions
      -- "ibhagwan/fzf-lua", -- for file_selector provider fzf
      -- "nvim-tree/nvim-web-devicons", --
      -- or 
      "echasnovski/mini.icons",
      -- "zbirenbaum/copilot.lua", -- for providers='copilot'
      {
        -- support for image pasting
        "HakonHarnes/img-clip.nvim",
        event = "VeryLazy",
        opts = {
          -- recommended settings
          default = {
            embed_image_as_base64 = false,
            prompt_for_file_name = false,
            drag_and_drop = {
              insert_mode = true,
            },
            -- required for Windows users
            use_absolute_path = true,
          },
        },
      },
      {
        -- Make sure to set this up properly if you have lazy=true
        'MeanderingProgrammer/render-markdown.nvim',
        event = "VeryLazy",
        opts = {
          file_types = { "markdown", "Avante" },
        },
        ft = { "markdown", "Avante" },
      },
    },
  },
}
