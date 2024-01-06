-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local set = vim.keymap.set

set({ "n", "v" }, ";", ":", { silent = false })
set({ "n", "v" }, ":", ";", { silent = false })
set("n", "gS", 'viw"0p', { silent = false, desc = "Replace with yank" })

set({ "n", "v" }, "J", "}")
set({ "n", "v" }, "}", "J")
set({ "n", "v" }, "K", "{")
set({ "n", "v" }, "{", "K")

if vim.g.vscode then
  vim.cmd([[
    nnoremap <S-h> <Cmd>Tabprevious<CR>
    nnoremap <S-l> <Cmd>Tabnext<CR>
    nnoremap <silent> o <Cmd>call VSCodeNotify('editor.action.insertLineAfter')<CR>i
    nnoremap <silent> O <Cmd>call VSCodeNotify('editor.action.insertLineBefore')<CR>i
    filetype indent off
  ]])
end
