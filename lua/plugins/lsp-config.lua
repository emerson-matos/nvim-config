return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      { "antosha417/nvim-lsp-file-operations", config = true },
      { "folke/lazydev.nvim" },
    },
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      local lspconfig = require("lspconfig")
      local cmp_nvim_lsp = require("cmp_nvim_lsp")
      local keymap = vim.keymap

      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("UserLspConfig", {}),
        callback = function(ev)
          -- Buffer local mappings.
          -- See `:help vim.lsp.*` for documentation on any of the below functions

          local opts = { buffer = ev.buf, silent = true }
          opts.desc = "Show LSP References"
          keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts)

          opts.desc = "Go To Declaration"
          keymap.set("n", "gD", vim.lsp.buf.declaration, opts)

          opts.desc = "Show LSP definitions"
          keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts)

          opts.desc = "Show LSP implementations"
          keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts)

          opts.desc = "Show LSP type definitions"
          keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts)

          opts.desc = "See available code actions LSP References"
          keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)

          opts.desc = "Smart rename"
          keymap.set("n", "<leader>cr", vim.lsp.buf.rename, opts)

          opts.desc = "Show LSP References"
          keymap.set("n", "gd", vim.lsp.buf.definition, opts)

          opts.desc = "Show buffer diagnostics"
          keymap.set("n", "<leader>cX", "<cmd>Telescope diagnostics bufnr=0<CR>", opts)

          opts.desc = "Show line diagnostics"
          keymap.set("n", "<leader>cx", vim.diagnostic.open_float, opts)

          opts.desc = "Go to previous diagnostic"
          keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)

          opts.desc = "Go to next diagnostic"
          keymap.set("n", "]d", vim.diagnostic.goto_next, opts)

          opts.desc = "Show LSP documentation"
          keymap.set("n", "K", vim.lsp.buf.hover, opts)

          opts.desc = "Restart LSP"
          keymap.set("n", "<leader>cr", "<cmd>:LspRestart<CR>", opts)
        end,
      })

      vim.api.nvim_create_autocmd("BufWritePre", {
        callback = function()
          local params = vim.lsp.util.make_range_params()
          params.context = { diagnostics = vim.lsp.diagnostic.get_line_diagnostics() }

          local clients = vim.lsp.get_clients({ bufnr = 0, method = "textDocument/codeAction" })
          if #clients == 0 then
            vim.notify("error no LSP clients", "error")
            return
          end

          local results = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params)
          if not results then
            vim.notify("error no LSP textDocument/codeAction", "error")
            return
          end
          for _, result in pairs(results) do
            for _, action in pairs(result.result or {}) do
              if action.kind == "source.organizeImports" then
                vim.lsp.buf.code_action({ context = { only = { "source.organizeImports" } }, apply = true })
                vim.wait(100)
                break
              end
            end
          end
        end,
      })

      local capabilities = cmp_nvim_lsp.default_capabilities()
      local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
      for type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
      end

      lspconfig.lua_ls.setup({
        capabilities = capabilities,
        settings = {
          Lua = {
            -- make the language server recognize "vim" global
            diagnostics = {
              globals = { "vim" },
            },
            completion = {
              callSnippet = "Replace",
            },
          },
        },
      })
      lspconfig.rust_analyzer.setup({
        capabilities = capabilities,
      })
      lspconfig.clojure_lsp.setup({
        capabilities = capabilities,
      })
      lspconfig.gopls.setup({
        capabilities = capabilities,
      })
      lspconfig.tsserver.setup({
        capabilities = capabilities,
      })
    end,
  },
}
