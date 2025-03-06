return {
  {
    "olimorris/codecompanion.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    config = true,
    lazy = false,
    keys = {
      {
        "<leader>a",
        "<cmd>CodeCompanionActions<cr>",
        mode = "n",
        noremap = true,
        silent = true,
      },
      {
        "<leader>a",
        "<cmd>CodeCompanionActions<cr>",
        mode = "v",
        noremap = true,
        silent = true,
      },
      {
        "ga",
        "<cmd>CodeCompanionChat Add<cr>",
        mode = "v",
        noremap = true,
        silent = true,
      },
    },
    opts = {
      strategies = {
        chat = {
          adapter = "ollama",
        },
        inline = {
          adapter = "ollama",
        },
        agent = {
          adapter = "ollama",
        },
      },
      adapters = {
        ollama = function()
          return require("codecompanion.adapters").extend("ollama", {
            schema = {
              model = {
                default = "deepseek-r1:14b",
              },
              num_ctx = {
                default = 4096,
              },
            },
          })
        end,
      },
    },
  },
}
