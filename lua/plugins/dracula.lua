return {
  "dracula/vim",
  name = "dracula",
  lazy = false,
  config = function()
    vim.cmd.colorscheme("dracula")
    vim.g.dracula_colorterm = 0
  end,
}
