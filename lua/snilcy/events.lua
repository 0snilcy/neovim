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

api.nvim_create_autocmd({ "WinEnter" }, {
	callback = function()
		local wins = api.nvim_list_wins()
		for _, win_id in ipairs(wins) do
			local config = api.nvim_win_get_config(win_id)
			-- print(data.event)
			-- local is_float_window = not (config.zindex == nil)
			local is_float_window = not (config.zindex == nil) and config.focusable
			if is_float_window then
				api.nvim_win_set_config(win_id, {
					border = "rounded",
				})
			end
		end
	end,
})
