return {
  "dracula/vim",
  config = function()
    vim.cmd.colorscheme("dracula")
    vim.g.dracula_colorterm = 0
  end,
}
