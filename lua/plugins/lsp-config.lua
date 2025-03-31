return {
  -- lspconfig
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      -- "jose-elias-alvarez/typescript.nvim",
      -- "hrsh7th/cmp-nvim-lsp",
      "saghen/blink.cmp",
      -- Useful status updates for LSP.
      { "j-hui/fidget.nvim", opts = {} },
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
    keys = {
      -- { "<leader>cl", function() Snacks.picker.lsp_config() end, desc = "Lsp Info" },
      -- { "gK", function() return vim.lsp.buf.signature_help() end, desc = "Signature Help" },
      -- { "<c-k>", function() return vim.lsp.buf.signature_help() end, mode = "i", desc = "Signature Help" },
      { "<leader>ca", vim.lsp.buf.code_action, desc = "Code Action", mode = { "n", "x" } },
      { "<leader>cf", vim.lsp.buf.format,      desc = "Format code", mode = { "n", "x" } },
      -- { "<leader>cc", vim.lsp.codelens.run, desc = "Run Codelens", mode = { "n", "x" } },
      -- { "<leader>cC", vim.lsp.codelens.refresh, desc = "Refresh & Display Codelens", mode = { "n" } },
      -- { "<leader>cR", function() Snacks.rename.rename_file() end, desc = "Rename File", mode ={"n"}, has = { "workspace/didRenameFiles", "workspace/willRenameFiles" } },
      -- { "<leader>cr", vim.lsp.buf.rename, desc = "Rename" },
      -- { "<leader>cA", LazyVim.lsp.action.source, desc = "Source Action", has = "codeAction" },
      -- { "]]", function() Snacks.words.jump(vim.v.count1) end, has = "documentHighlight",
      -- desc = "Next Reference", cond = function() return Snacks.words.is_enabled() end },
      -- { "[[", function() Snacks.words.jump(-vim.v.count1) end, has = "documentHighlight",
      -- desc = "Prev Reference", cond = function() return Snacks.words.is_enabled() end },
      -- { "<a-n>", function() Snacks.words.jump(vim.v.count1, true) end, has = "documentHighlight",
      -- desc = "Next Reference", cond = function() return Snacks.words.is_enabled() end },
      -- { "<a-p>", function() Snacks.words.jump(-vim.v.count1, true) end, has = "documentHighlight",
      -- desc = "Prev Reference", cond = function() return Snacks.words.is_enabled() end },
    },
    opts = function()
      ---@class PluginLspOpts
      local ret = {
        -- options for vim.diagnostic.config()
        ---@type vim.diagnostic.Opts
        diagnostics = {
          underline = true,
          update_in_insert = false,
          severity_sort = true,
          signs = {
            text = {
              [vim.diagnostic.severity.ERROR] = " ",
              [vim.diagnostic.severity.WARN] = " ",
              [vim.diagnostic.severity.HINT] = " ",
              [vim.diagnostic.severity.INFO] = " ",
            },
          },
        },
        inlay_hints = {
          enabled = true,
          exclude = { "vue" }, -- filetypes for which you don't want to enable inlay hints
        },
        codelens = {
          enabled = true,
        },
        -- add any global capabilities here
        -- capabilities = {
        --   workspace = {
        --     fileOperations = {
        --       didRename = true,
        --       willRename = true,
        --     },
        --   },
        -- },
        -- options for vim.lsp.buf.format
        -- `bufnr` and `filter` is handled by the LazyVim formatter,
        -- but can be also overridden when specified
        format = {
          formatting_options = nil,
          timeout_ms = nil,
        },
        -- LSP Server Settings
        ---@type lspconfig.options
        servers = {
          lua_ls = {},
          -- rust_analyzer = {},
          -- clojure_lsp = {},
          gopls = {},
          nixd = {
            settings = {
              formatting = {
                command = { "nixfmt" },
              },
            },
          },
          tailwindcss = {
            -- exclude a filetype from the default_config
            -- filetypes_exclude = { "markdown" },
            -- add additional filetypes to the default_config
            -- filetypes_include = {},
            -- to fully override the default_config, change the below
            -- filetypes = {}
          },
          eslint = {},
          ts_ls = {},
        },
      }
      return ret
    end,
    ---@param opts PluginLspOpts
    config = function(_, opts)
      -- setup autoformat
      -- LazyVim.format.register(LazyVim.lsp.formatter())

      local register_capability = vim.lsp.handlers["client/registerCapability"]
      vim.lsp.handlers["client/registerCapability"] = function(err, res, ctx)
        ---@diagnostic disable-next-line: no-unknown
        local ret = register_capability(err, res, ctx)
        local client = vim.lsp.get_client_by_id(ctx.client_id)
        if client then
          for buffer in pairs(client.attached_buffers) do
            vim.api.nvim_exec_autocmds("User", {
              pattern = "LspDynamicCapability",
              data = { client_id = client.id, buffer = buffer },
            })
          end
        end
        return ret
      end

      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(args)
          local buffer = args.buf ---@type number
          return vim.lsp.get_client_by_id(args.data.client_id)
        end,
      })

      vim.api.nvim_create_autocmd("User", {
        pattern = "LspDynamicCapability",
        group = opts and opts.group or nil,
        callback = function(args)
          local client = vim.lsp.get_client_by_id(args.data.client_id)
          local buffer = args.data.buffer ---@type number
          if client then
            if not vim.api.nvim_buf_is_valid(buffer) then
              return
            end
            -- don't trigger on non-listed buffers
            if not vim.bo[buffer].buflisted then
              return
            end
            -- don't trigger on nofile buffers
            if vim.bo[buffer].buftype == "nofile" then
              return
            end
            -- FIXME: this does not work
            -- for method, clients in pairs(M._supports_method) do
            --   clients[client] = clients[client] or {}
            --   if not clients[client][buffer] then
            --     if client.supports_method and client.supports_method(method, { bufnr = buffer }) then
            --       clients[client][buffer] = true
            --       vim.api.nvim_exec_autocmds("User", {
            --         pattern = "LspSupportsMethod",
            --         data = { client_id = client.id, buffer = buffer, method = method },
            --       })
            --     end
            --   end
            -- end
          end
        end,
      })

      -- diagnostics signs
      for severity, icon in pairs(opts.diagnostics.signs.text) do
        local name = vim.diagnostic.severity[severity]:lower():gsub("^%l", string.upper)
        name = "DiagnosticSign" .. name
        vim.fn.sign_define(name, { text = icon, texthl = name, numhl = "" })
      end

      -- inlay hints
      -- if opts.inlay_hints.enabled then
      -- LazyVim.lsp.on_supports_method("textDocument/inlayHint", function(client, buffer)
      --   if
      --     vim.api.nvim_buf_is_valid(buffer)
      --     and vim.bo[buffer].buftype == ""
      --     and not vim.tbl_contains(opts.inlay_hints.exclude, vim.bo[buffer].filetype)
      --   then
      --     vim.lsp.inlay_hint.enable(true, { bufnr = buffer })
      --   end
      -- end)
      -- end

      -- code lens
      -- LazyVim.lsp.on_supports_method("textDocument/codeLens", function(client, buffer)
      --   vim.lsp.codelens.refresh()
      --   vim.api.nvim_create_autocmd({ "BufEnter", "CursorHold", "InsertLeave" }, {
      --     buffer = buffer,
      --     callback = vim.lsp.codelens.refresh,
      --   })
      -- end)

      vim.diagnostic.config(vim.deepcopy(opts.diagnostics))

      local servers = opts.servers
      local has_cmp, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
      local has_blink, blink = pcall(require, "blink.cmp")
      local capabilities = vim.tbl_deep_extend(
        "force",
        {},
        vim.lsp.protocol.make_client_capabilities(),
        has_cmp and cmp_nvim_lsp.default_capabilities() or {},
        has_blink and blink.get_lsp_capabilities() or {}
      )

      for server, server_opts in pairs(servers) do
        if server_opts then
          server_opts = server_opts == true and {} or server_opts
          if server_opts.enabled ~= false then
            server_opts = vim.tbl_deep_extend("force", {
              capabilities = vim.deepcopy(capabilities),
            }, servers[server] or {})

            require("lspconfig")[server].setup(server_opts)
          end
        end
      end
    end,
  },
}
