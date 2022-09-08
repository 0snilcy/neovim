local status = pcall(require, "chadtree")
if not status then
	return
end

-- vim.api.nvim_create_autocmd({ "CHADTree" }, {
-- 	callback = function(data)
-- 		dump(data)
-- 	end,
-- })

vim.api.nvim_create_autocmd({ "BufEnter" }, {
	callback = function(data)
		local buf_id = data.buf
		local filetype = vim.api.nvim_buf_get_option(buf_id, "filetype")
		local is_chadtree_type = filetype == "CHADTree"

		if is_chadtree_type then
			vim.api.nvim_buf_set_keymap(buf_id, "n", "<A-j>", ":CHADopen --nofocus<CR>", {})
			vim.api.nvim_buf_set_keymap(buf_id, "n", "<A-k>", ":CHADopen --nofocus<CR>", {})
		end
	end,
})

vim.g.chadtree_settings = {
	options = {
		mimetypes = {
			allow_exts = {},
		},
		show_hidden = true,
	},
	view = {
		open_direction = "right",
	},
}
