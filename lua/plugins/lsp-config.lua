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
        prismals = {},
        ts_ls = {
          -- keys = {
          --   {
          --     "gD",
          --     function()
          --       local params = vim.lsp.util.make_position_params()
          --       LazyVim.lsp.execute({
          --         command = "typescript.goToSourceDefinition",
          --         arguments = { params.textDocument.uri, params.position },
          --         open = true,
          --       })
          --     end,
          --     desc = "Goto Source Definition",
          --   },
          --   {
          --     "gR",
          --     function()
          --       LazyVim.lsp.execute({
          --         command = "typescript.findAllFileReferences",
          --         arguments = { vim.uri_from_bufnr(0) },
          --         open = true,
          --       })
          --     end,
          --     desc = "File References",
          --   },
          --   {
          --     "<leader>co",
          --     LazyVim.lsp.action["source.organizeImports"],
          --     desc = "Organize Imports",
          --   },
          --   {
          --     "<leader>cM",
          --     LazyVim.lsp.action["source.addMissingImports.ts"],
          --     desc = "Add missing imports",
          --   },
          --   {
          --     "<leader>cu",
          --     LazyVim.lsp.action["source.removeUnused.ts"],
          --     desc = "Remove unused imports",
          --   },
          --   {
          -- "<leader>cD",
          -- LazyVim.lsp.action["source.fixAll.ts"],
          -- desc = "Fix all diagnostics",
          -- },
          -- },
        },
        tailwindcss = {},
        eslint = {},
        vtsls = false,
      },
      setup = {
        vtsls = function()
          -- disable vtsls
          return true
        end,
      },
    },
    keys = {
      -- { "<leader>cl", function() Snacks.picker.lsp_config() end, desc = "Lsp Info" },
      -- { "K", function() return vim.lsp.buf.hover() end, desc = "Hover" },
      -- { "gK", function() return vim.lsp.buf.signature_help() end, desc = "Signature Help" },
      -- { "<c-k>", function() return vim.lsp.buf.signature_help() end, mode = "i", desc = "Signature Help" },
      -- { "<leader>ca", vim.lsp.buf.code_action, desc = "Code Action", mode = { "n", "x" } },
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
      -- { "[d", vim.diagnostic.gotto_next, desc = "Go to previous diagnostic" },
      -- { "]d", vim.diagnostic.gotto_next, desc = "Go to next diagnostic" },
    },
  },
  -- TypeScript
  -- {
  --   "pmizio/typescript-tools.nvim",
  --   dependencies = {
  --     "stevearc/conform.nvim",
  --     "nvim-lua/plenary.nvim",
  --     "neovim/nvim-lspconfig",
  --   },
  --   ft = {
  --     "typescript",
  --     "typescriptreact",
  --     "typescript.tsx",
  --     "javascript",
  --     "javascriptreact",
  --     "javascript.jsx",
  --   },
  --   opts = {
  --     -- spawn additional tsserver instance to calculate diagnostics on it
  --     separate_diagnostic_server = true,
  --     -- "change"|"insert_leave" determine when the client asks the server about diagnostic
  --     publish_diagnostic_on = "insert_leave",
  --     -- array of strings("fix_all"|"add_missing_imports"|"remove_unused"|
  --     -- "remove_unused_imports"|"organize_imports") -- or string "all"
  --     -- to include all supported code actions
  --     -- specify commands exposed as code_actions
  --     expose_as_code_action = {},
  --     -- string|nil - specify a custom path to `tsserver.js` file, if this is nil or file under path
  --     -- not exists then standard path resolution strategy is applied
  --     tsserver_path = nil,
  --     -- specify a list of plugins to load by tsserver, e.g., for support `styled-components`
  --     -- (see 💅 `styled-components` support section)
  --     tsserver_plugins = {},
  --     -- this value is passed to: https://nodejs.org/api/cli.html#--max-old-space-sizesize-in-megabytes
  --     -- memory limit in megabytes or "auto"(basically no limit)
  --     tsserver_max_memory = "auto",
  --     -- described below
  --     tsserver_format_options = {
  --       insertSpaceAfterCommaDelimiter = true,
  --       insertSpaceAfterConstructor = false,
  --       insertSpaceAfterSemicolonInForStatements = true,
  --       insertSpaceBeforeAndAfterBinaryOperators = true,
  --       insertSpaceAfterKeywordsInControlFlowStatements = true,
  --       insertSpaceAfterFunctionKeywordForAnonymousFunctions = true,
  --       insertSpaceBeforeFunctionParenthesis = false,
  --       insertSpaceAfterOpeningAndBeforeClosingNonemptyParenthesis = false,
  --       insertSpaceAfterOpeningAndBeforeClosingNonemptyBrackets = false,
  --       insertSpaceAfterOpeningAndBeforeClosingNonemptyBraces = true,
  --       insertSpaceAfterOpeningAndBeforeClosingEmptyBraces = true,
  --       insertSpaceAfterOpeningAndBeforeClosingTemplateStringBraces = false,
  --       insertSpaceAfterOpeningAndBeforeClosingJsxExpressionBraces = false,
  --       insertSpaceAfterTypeAssertion = false,
  --       placeOpenBraceOnNewLineForFunctions = false,
  --       placeOpenBraceOnNewLineForControlBlocks = false,
  --       semicolons = "insert",
  --       indentSwitchCase = true,
  --     },
  --     tsserver_file_preferences = {
  --       importModuleSpecifierPreference = "non-relative",
  --     },
  --     -- locale of all tsserver messages, supported locales you can find here:
  --     -- https://github.com/microsoft/TypeScript/blob/3c221fc086be52b19801f6e8d82596d04607ede6/src/compiler/utilitiesPublic.ts#L620
  --     tsserver_locale = "pt-br",
  --     -- mirror of VSCode's `typescript.suggest.completeFunctionCalls`
  --     complete_function_calls = false,
  --     include_completions_with_insert_text = true,
  --     -- CodeLens
  --     -- WARNING: Experimental feature also in VSCode, because it might hit performance of server.
  --     -- possible values: ("off"|"all"|"implementations_only"|"references_only")
  --     code_lens = "all",
  --     -- by default code lenses are displayed on all referencable values and for some of you it can
  --     -- be too much this option reduce count of them by removing member references from lenses
  --     disable_member_code_lens = true,
  --     -- JSXCloseTag
  --     -- WARNING: it is disabled by default (maybe you configuration or distro already uses nvim-ts-autotag,
  --     -- that maybe have a conflict if enable this feature. )
  --     jsx_close_tag = {
  --       enable = false,
  --       filetypes = { "javascriptreact", "typescriptreact" },
  --     },
  --   },
  -- },
}
