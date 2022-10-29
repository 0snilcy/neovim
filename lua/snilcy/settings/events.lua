local on_win_filetype_open = require("utils.api").on_win_filetype_open

local api = vim.api
local cmd = vim.cmd

-- windows to close with "q"
api.nvim_create_autocmd("FileType", {
  pattern = { "help", "startuptime", "qf", "lspinfo" },
  command = [[nnoremap <buffer><silent> q :close<CR>]],
})

api.nvim_create_autocmd("FileType", {
  pattern = "man",
  command = [[nnoremap <buffer><silent> q :quit<CR>]],
})

on_win_filetype_open({
  "null-ls-info",
  "lspinfo",
  "mason",
}, function(data)
  api.nvim_win_set_config(data.window, {
    border = "rounded",
  })
end)

-- cmd([[
--   filetype indent plugin on
--   syntax enable
-- ]])

-- don't auto commenting new lines
-- cmd([[au BufEnter * set fo-=c fo-=r fo-=o]])

-- -- remove line lenght marker for selected filetypes
-- cmd [[autocmd FileType text,markdown,html,xhtml,javascript setlocal cc=0]]
-- -- 2 spaces for selected filetypes
-- cmd [[
-- autocmd FileType xml,html,xhtml,css,scss,javascript,lua,yaml,htmljinja setlocal shiftwidth=2 tabstop=2
-- ]]
-- -- С этой строкой отлично форматирует html файл, который содержит jinja2
-- cmd [[ autocmd BufNewFile,BufRead *.html set filetype=htmldjango ]]

-- -- Запоминает где nvim последний раз редактировал файл
cmd([[
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
]])

-- This adds the ":DiffOrig" command.  Use this in a modified buffer to see the
-- differences with the file it was loaded from.  See |diff| and |:DiffOrig|.
-- cmd([[
--   command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
-- 		  \ | wincmd p | diffthis
-- ]])

-- cmd([[ autocmd FileType c setlocal foldmethod=syntax ]])

-- cmd([[
--   autocmd StdinReadPre * let s:std_in=1
--   autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') |
--       \ execute 'CHADopen' | execute 'cd '.argv()[0] | endif
-- ]])

-- Подсвечивает на доли секунды скопированную часть текста
-- exec([[
-- augroup YankHighlight
-- autocmd!
-- autocmd TextYankPost * silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=200}
-- augroup end
-- ]], false)
