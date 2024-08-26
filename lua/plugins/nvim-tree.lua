return {
	"nvim-tree/nvim-tree.lua",
	lazy = true,
  dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		vim.cmd([[hi NvimTreeNormal guibg=NONE ctermbg=None]])
		require("nvim-tree").setup({
			filters = {
				dotfiles = false,
			},
			view = {
				adaptive_size = true,
			},
		})
	end,
}
