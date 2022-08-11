local api = vim.api

-- windows to close with "q"
api.nvim_create_autocmd("FileType", {
	pattern = { "help", "startuptime", "qf", "lspinfo" },
	command = [[nnoremap <buffer><silent> q :close<CR>]],
})

api.nvim_create_autocmd("FileType", {
	pattern = "man",
	command = [[nnoremap <buffer><silent> q :quit<CR>]],
})
