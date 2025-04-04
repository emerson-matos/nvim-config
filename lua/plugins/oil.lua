return {
  {

    "nvim-neo-tree/neo-tree.nvim",
    enabled = false,
    -- opts = {
    --   window = { position = "right" },
    --   filesystem = {
    --     filtered_items = {
    --       hide_dotfiles = false,
    --       hide_by_name = { ".git", ".DS_Store" },
    --       always_show = { ".env", ".env.local" },
    --     },
    --   },
  },
  {
    "stevearc/oil.nvim",
    event = "VeryLazy",
    ---@module 'oil'
    ---@type oil.SetupOpts
    opts = {
      view_options = {
        -- Show files and directories that start with "."
        show_hidden = true,
        natural_order = true,
        is_always_hidden = function(name, _)
          return name == ".." or name == ".git" or name == ".direnv"
        end,
      },
      win_options = {
        signcolumn = "yes:2",
      },
    },
    -- Optional dependencies
    dependencies = { { "echasnovski/mini.icons", opts = {} } },
    keys = { { "<leader>e", "<cmd>Oil<cr>", { desc = "Open parent directory" } } },
    -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
    -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
    -- lazy = false,
  },
  {
    "SirZenith/oil-vcs-status",
    dependencies = { "stevearc/oil.nvim" },
    event = "VeryLazy",
    config = function()
      local status_const = require("oil-vcs-status.constant.status")

      local StatusType = status_const.StatusType

      require("oil-vcs-status").setup({
        -- Executable path of each version control system.
        vcs_executable = {
          git = "git",
          svn = "svn",
        },

        -- If trigger time between two file system event of the same entry is less
        -- than this value, newer event will be ignored, unit: milisecond.
        ---@type integer
        fs_event_debounce = 500,

        -- Sign character used by each status.
        status_symbol = {
          [StatusType.Added] = "",
          [StatusType.Copied] = "󰆏",
          [StatusType.Deleted] = "",
          [StatusType.Ignored] = "",
          [StatusType.Modified] = "",
          [StatusType.Renamed] = "",
          [StatusType.TypeChanged] = "󰉺",
          [StatusType.Unmodified] = " ",
          [StatusType.Unmerged] = "",
          [StatusType.Untracked] = "",
          [StatusType.External] = "",

          [StatusType.UpstreamAdded] = "󰈞",
          [StatusType.UpstreamCopied] = "󰈢",
          [StatusType.UpstreamDeleted] = "",
          [StatusType.UpstreamIgnored] = " ",
          [StatusType.UpstreamModified] = "󰏫",
          [StatusType.UpstreamRenamed] = "",
          [StatusType.UpstreamTypeChanged] = "󱧶",
          [StatusType.UpstreamUnmodified] = " ",
          [StatusType.UpstreamUnmerged] = "",
          [StatusType.UpstreamUntracked] = " ",
          [StatusType.UpstreamExternal] = "",
        },

        -- Highlight group name used by each status type.
        ---@type table<oil-vcs-status.StatusType, string | false>
        status_hl_group = {
          [StatusType.Added] = "OilVcsStatusAdded",
          [StatusType.Copied] = "OilVcsStatusCopied",
          [StatusType.Deleted] = "OilVcsStatusDeleted",
          [StatusType.Ignored] = "OilVcsStatusIgnored",
          [StatusType.Modified] = "OilVcsStatusModified",
          [StatusType.Renamed] = "OilVcsStatusRenamed",
          [StatusType.TypeChanged] = "OilVcsStatusTypeChanged",
          [StatusType.Unmodified] = "OilVcsStatusUnmodified",
          [StatusType.Unmerged] = "OilVcsStatusUnmerged",
          [StatusType.Untracked] = "OilVcsStatusUntracked",
          [StatusType.External] = "OilVcsStatusExternal",

          [StatusType.UpstreamAdded] = "OilVcsStatusUpstreamAdded",
          [StatusType.UpstreamCopied] = "OilVcsStatusUpstreamCopied",
          [StatusType.UpstreamDeleted] = "OilVcsStatusUpstreamDeleted",
          [StatusType.UpstreamIgnored] = "OilVcsStatusUpstreamIgnored",
          [StatusType.UpstreamModified] = "OilVcsStatusUpstreamModified",
          [StatusType.UpstreamRenamed] = "OilVcsStatusUpstreamRenamed",
          [StatusType.UpstreamTypeChanged] = "OilVcsStatusUpstreamTypeChanged",
          [StatusType.UpstreamUnmodified] = "OilVcsStatusUpstreamUnmodified",
          [StatusType.UpstreamUnmerged] = "OilVcsStatusUpstreamUnmerged",
          [StatusType.UpstreamUntracked] = "OilVcsStatusUpstreamUntracked",
          [StatusType.UpstreamExternal] = "OilVcsStatusUpstreamExternal",
        },

        -- Sign priority of each staus. When sign column width is less then staus
        -- symbol number, symbol with higher priority will be shown.
        -- If signcolumn is wide enough, signs will be display from left to right in
        -- order of priority from low to high.
        ---@type table<oil-vcs-status.StatusType, number>
        status_priority = {
          [StatusType.UpstreamIgnored] = 0,
          [StatusType.Ignored] = 0,

          [StatusType.UpstreamUntracked] = 1,
          [StatusType.Untracked] = 1,

          [StatusType.UpstreamUnmodified] = 2,
          [StatusType.Unmodified] = 2,
          [StatusType.UpstreamExternal] = 2,
          [StatusType.External] = 2,

          [StatusType.UpstreamCopied] = 3,
          [StatusType.UpstreamRenamed] = 3,
          [StatusType.UpstreamTypeChanged] = 3,

          [StatusType.UpstreamDeleted] = 4,
          [StatusType.UpstreamModified] = 4,
          [StatusType.UpstreamAdded] = 4,

          [StatusType.UpstreamUnmerged] = 5,

          [StatusType.Copied] = 13,
          [StatusType.Renamed] = 13,
          [StatusType.TypeChanged] = 13,

          [StatusType.Deleted] = 14,
          [StatusType.Modified] = 14,
          [StatusType.Added] = 14,

          [StatusType.Unmerged] = 15,
        },

        vcs_specific = {
          git = {
            -- `git status` command triggers file system event when it finished.
            -- Plugin will ignore file system event in this amount of time, after
            -- `git status` finishes its executation. Unit: milisecond.
            ---@type integer
            status_update_debounce = 200,
          },
        },
      })
    end,
  },
}
