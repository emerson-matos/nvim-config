return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "jose-elias-alvarez/typescript.nvim",
      --       "hrsh7th/cmp-nvim-lsp",
      --       { "antosha417/nvim-lsp-file-operations", config = true },
      {
        "folke/lazydev.nvim",
        ft = "lua", -- only load on lua files
        opts = {
          library = {
            -- See the configuration section for more details
            -- Load luvit types when the vim.uv word is found
            { path = "#{3rd}/luv/library", words = { "vim%.uv" } },
          },
        },
      },
    },
    ---@class PluginLspOpts
    opts = {
      ---@type lspconfig.options
      servers = {
        lua_ls = {},
        rust_analyzer = {},
        clojure_lsp = {},
        gopls = {},
        nixd = {
          settings = {
            formatting = {
              command = { "nixfmt" },
            },
          },
        },
        jdtls = {},
        tailwindcss = {},
        ts_ls = {
          keys = {
            {
              "gD",
              function()
                local params = vim.lsp.util.make_position_params()
                LazyVim.lsp.execute({
                  command = "typescript.goToSourceDefinition",
                  arguments = { params.textDocument.uri, params.position },
                  open = true,
                })
              end,
              desc = "Goto Source Definition",
            },
            {
              "gR",
              function()
                LazyVim.lsp.execute({
                  command = "typescript.findAllFileReferences",
                  arguments = { vim.uri_from_bufnr(0) },
                  open = true,
                })
              end,
              desc = "File References",
            },
            {
              "<leader>co",
              LazyVim.lsp.action["source.organizeImports"],
              desc = "Organize Imports",
            },
            {
              "<leader>cM",
              LazyVim.lsp.action["source.addMissingImports.ts"],
              desc = "Add missing imports",
            },
            {
              "<leader>cu",
              LazyVim.lsp.action["source.removeUnused.ts"],
              desc = "Remove unused imports",
            },
            {
              "<leader>cD",
              LazyVim.lsp.action["source.fixAll.ts"],
              desc = "Fix all diagnostics",
            },
          },
        },
        vtsls = false,
      },
    },
  },
}
