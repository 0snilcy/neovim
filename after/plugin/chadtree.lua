local status, chadtree = pcall(require, "chadtree")
if not status then
	return
end

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
