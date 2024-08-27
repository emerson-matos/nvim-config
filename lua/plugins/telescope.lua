return {
  {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    tag = "0.1.8",
    dependencies = {
      -- "nvim-telescope/telescope-ui-select.nvim",
      "folke/todo-comments.nvim",
      "nvim-lua/plenary.nvim",
      "rcarriga/nvim-notify",
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
      },
      "nvim-tree/nvim-web-devicons",
      -- {
      --   "neovim/nvim-lspconfig",
      -- opts = function()
      -- local Keys = require("lazyvim.plugins.lsp.keymaps").get()
      -- stylua: ignore
      -- vim.list_extend(Keys, {
      -- { "gd", function() require("telescope.builtin").lsp_definitions({ reuse_win = true }) end, desc = "Goto Definition", has = "definition" },
      -- { "gr", "<cmd>Telescope lsp_references<cr>", desc = "References", nowait = true },
      -- { "gI", function() require("telescope.builtin").lsp_implementations({ reuse_win = true }) end, desc = "Goto Implementation" },
      -- { "gy", function() require("telescope.builtin").lsp_type_definitions({ reuse_win = true }) end, desc = "Goto T[y]pe Definition" },
      -- })
      -- end,
      -- }
    },
    keys = {
      {
        "<leader>,",
        "<cmd>Telescope buffers sort_mru=true sort_lastused=true<cr>",
        desc = "Switch Buffer",
      },
      {
        "<leader>/",
        function()
          require("telescope.builtin").live_grep()
        end,
        desc = "Grep (Root Dir)",
      },
      { "<leader>:",  "<cmd>Telescope command_history<cr>",           desc = "Command History" },
      {
        "<leader><space>",
        function()
          require("telescope.builtin").find_files()
        end,
        desc = "Find Files (Root Dir)",
      },
      -- { "<leader>fc", LazyVim.pick.config_files(), desc = "Find Config File" },
      {
        "<leader>ff",
        "<cmd>Telescope find_files<cr>",
        desc = "Find Files (Root Dir)",
      },
      -- { "<leader>fF", LazyVim.pick("files", { root = false }), desc = "Find Files (cwd)" },
      {
        "<leader>fg",
        "<cmd>Telescope git_files<cr>",
        desc = "Find Files (git-files)",
      },
      { "<leader>fr", "<cmd>Telescope oldfiles<cr>",                  desc = "Recent" },
      -- { "<leader>fR", LazyVim.pick("oldfiles", { cwd = vim.uv.cwd() }), desc = "Recent (cwd)" },
      { "<leader>ft", "<cmd>TodoTelescope<cr>",                       desc = "Find TODOs" },
      -- git
      { "<leader>gl", "<cmd>Telescope git_commits<CR>",               desc = "Commits" },
      { "<leader>gs", "<cmd>Telescope git_status<CR>",                desc = "Status" },
      -- search
      { '<leader>s"', "<cmd>Telescope registers<cr>",                 desc = "Registers" },
      { "<leader>sa", "<cmd>Telescope autocommands<cr>",              desc = "Auto Commands" },
      { "<leader>sb", "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "Buffer" },
      { "<leader>sc", "<cmd>Telescope command_history<cr>",           desc = "Command History" },
      { "<leader>sC", "<cmd>Telescope commands<cr>",                  desc = "Commands" },
      {
        "<leader>sd",
        "<cmd>Telescope diagnostics bufnr=0<cr>",
        desc = "Document Diagnostics",
      },
      {
        "<leader>sD",
        "<cmd>Telescope diagnostics<cr>",
        desc = "Workspace Diagnostics",
      },
      { "<leader>sg", "<cmd>Telescope live_grep<cr>", desc = "Grep (Root Dir)" },
      { "<leader>sG", "<cmd>Telescope live_grep<cr>", desc = "Grep (cwd)" },
      { "<leader>sh", "<cmd>Telescope help_tags<cr>", desc = "Help Pages" },
      {
        "<leader>sH",
        "<cmd>Telescope highlights<cr>",
        desc = "Search Highlight Groups",
      },
      { "<leader>sj", "<cmd>Telescope jumplist<cr>",    desc = "Jumplist" },
      { "<leader>sk", "<cmd>Telescope keymaps<cr>",     desc = "Key Maps" },
      { "<leader>sl", "<cmd>Telescope loclist<cr>",     desc = "Location List" },
      { "<leader>sM", "<cmd>Telescope man_pages<cr>",   desc = "Man Pages" },
      { "<leader>sm", "<cmd>Telescope marks<cr>",       desc = "Jump to Mark" },
      { "<leader>so", "<cmd>Telescope vim_options<cr>", desc = "Options" },
      { "<leader>sR", "<cmd>Telescope resume<cr>",      desc = "Resume" },
      { "<leader>sq", "<cmd>Telescope quickfix<cr>",    desc = "Quickfix List" },
      {
        "<leader>ft",
        function() require("telescope.builtin").colorscheme { enable_preview = true, ignore_builtins = true } end,
        desc = "Find themes",
      },
      -- { "<leader>sw", LazyVim.pick("grep_string", { word_match = "-w" }), desc = "Word (Root Dir)" },
      -- { "<leader>sW", LazyVim.pick("grep_string", { root = false, word_match = "-w" }), desc = "Word (cwd)" },
      -- { "<leader>sw", LazyVim.pick("grep_string"), mode = "v", desc = "Selection (Root Dir)" },
      -- { "<leader>sW", LazyVim.pick("grep_string", { root = false }), mode = "v", desc = "Selection (cwd)" },
      -- { "<leader>uC", LazyVim.pick("colorscheme", { enable_preview = true }), desc = "Colorscheme with Preview" },
      -- {
      --   "<leader>ss",
      --   function()
      --     require("telescope.builtin").lsp_document_symbols({
      --       symbols = LazyVim.config.get_kind_filter(),
      --     })
      --   end,
      --   desc = "Goto Symbol",
      -- },
      -- {
      -- "<leader>sS",
      -- function()
      -- require("telescope.builtin").lsp_dynamic_workspace_symbols({
      -- symbols = LazyVim.config.get_kind_filter(),
      -- })
      -- end,
      -- desc = "Goto Symbol (Workspace)",
      -- },
    },
    config = function()
      local telescope = require("telescope")
      local actions = require("telescope.actions")
      -- local telescope_themes = require("telescope.themes")
      telescope.setup({
        defaults = {
          mappings = {
            i = {
              ["<C-k>"] = actions.move_selection_previous,
              ["<C-j>"] = actions.move_selection_next,
              ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
            },
          },
          -- path_display = { "smart" },
        },
        -- extensions = {
          -- ["ui-select"] = {
            -- telescope_themes.get_dropdown({}),
          -- },
        -- },
      })

      telescope.load_extension("fzf")
      telescope.load_extension("notify")
      -- telescope.load_extension("ui-select")
    end,
  },
}
