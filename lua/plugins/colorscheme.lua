vim.cmd([[let g:sonokai_style = 'shusia'
        let g:sonokai_better_performance = 1]])

return {
  "sainnhe/sonokai",
  "Mofiqul/dracula.nvim",
  "ntk148v/vim-horizon",
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "dracula",
    },
  },
}
