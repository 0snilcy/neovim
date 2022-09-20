local status, tree = pcall(require, "nvim-tree")
if not status then
	return
end

tree.setup({
	reload_on_bufenter = true,
	sync_root_with_cwd = true,
	update_focused_file = {
		enable = true,
	},
	git = {
		enable = false,
	},
	view = {
		side = "right",
		width = 40,
		-- hide_root_folder = true,
		number = true,
		relativenumber = true,
	},
	diagnostics = {
		-- enable = true,
		-- show_on_dirs = true,
	},
	renderer = {
		add_trailing = true,
		group_empty = true,
		highlight_opened_files = "all",
	},
})
