return {
  {
    "akinsho/toggleterm.nvim",
    config = function ()
      require("toggleterm").setup({})
    end,
    keys = {
      {
        "<C-/>",
        "<cmd>ToggleTerm size=50 direction=float<cr>",
        desc = "Open a horizontal terminal at the Desktop directory",
      },
      {
        "<C-.>",
        "<cmd>ToggleTerm size=50 direction=float<cr>",
        desc = "Open a horizontal terminal at the Desktop directory",
      },
    },
  },
}
