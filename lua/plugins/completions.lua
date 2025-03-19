return {
   "hrsh7th/nvim-cmp",
   event = "InsertEnter",
  dependencies = {
  --   "onsails/lspkind-nvim",
  --   "hrsh7th/cmp-buffer",
  --   "hrsh7th/cmp-path",
    "hrsh7th/cmp-nvim-lsp",
  --   {
  --     "L3MON4D3/LuaSnip",
  --     version = "v2.*",
  --     build = "make install_jsregexp",
  --     dependencies = { "saadparwaiz1/cmp_luasnip", "rafamadriz/friendly-snippets" },
  --   },
  },
  -- config = function()
  --   local cmp = require("cmp")
  --   local lspkind = require('lspkind')
  --   require("luasnip.loaders.from_vscode").lazy_load()
  --
  --   cmp.setup({
  --     snippet = {
  --       -- REQUIRED - you must specify a snippet engine
  --       expand = function(args)
  --         -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
  --         require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
  --         -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
  --         -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
  --         -- vim.snippet.expand(args.body) -- For native neovim snippets (Neovim v0.10+)
  --       end,
  --     },
  --     window = {
  --       -- completion = cmp.config.window.bordered(),
  --       -- documentation = cmp.config.window.bordered(),
  --     },
  --
  --     mapping = cmp.mapping.preset.insert({
  --       ["<C-k>"] = cmp.mapping.select_prev_item(),
  --       ["<C-j>"] = cmp.mapping.select_next_item(),
  --       ["<C-b>"] = cmp.mapping.scroll_docs(-4),
  --       ["<C-f>"] = cmp.mapping.scroll_docs(4),
  --       ["<C-Space>"] = cmp.mapping.complete(),
  --       ["<C-e>"] = cmp.mapping.abort(),
  --       ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
  --     }),
  --     sources = cmp.config.sources({
  --       { name = "nvim_lsp" },
  --       -- { name = "vsnip" }, -- For vsnip users.
  --       { name = "luasnip" }, -- For luasnip users.
  --       -- { name = 'ultisnips' }, -- For ultisnips users.
  --       -- { name = 'snippy' }, -- For snippy users.
  --     }, {
  --         { name = "buffer" },
  --         { name = "path" },
  --       }),
  --     formatting = {
  --       format = lspkind.cmp_format({
  --         mode = 'symbol_text', -- show only symbol annotations
  --         -- maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
  --         -- can also be a function to dynamically calculate max width such as
  --         maxwidth = function() return math.floor(0.45 * vim.o.columns) end,
  --         ellipsis_char = '...', -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
  --         show_labelDetails = false, -- show labelDetails in menu. Disabled by default
  --       }),
  --     },
  --   })
  -- end,
}
