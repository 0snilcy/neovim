local M = {}

function M.setup()
	local chadtree_settings = {
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

	vim.api.nvim_set_var("chadtree_settings", chadtree_settings)
end

return M
