return {
  "noice.nvim",
  config = function()
    require("noice").setup({
      presets = {
        bottom_search = true, -- use a classic bottom cmdline for search
        inc_rename = true, -- enables an input dialog for inc-rename.nvim
        lsp_doc_border = true, -- add a border to hover docs and signature help
        command_palette = true,
      },
    })
  end,
}
