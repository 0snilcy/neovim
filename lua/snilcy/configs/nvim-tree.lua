return function()
	local nvim_tree = require("nvim-tree")

	nvim_tree.setup({
		-- Will change cwd of nvim-tree to that of new buffer's when opening nvim-tree.
		respect_buf_cwd = false,
		ignore_ft_on_setup = {
			"dashboard",
		},

		-- will not open on setup if the filetype is in this list
		-- -- TODO: Fix "update_focused_file"
		-- update_focused_file = { enable = true },
		filters = {
			dotfiles = false,

			-- Files to hide
			custom = {
				".git",
			},
		},
		disable_netrw = true,
		hijack_netrw = true,
		view = {
			adaptive_size = true,
			centralize_selection = true,
			number = true,
			relativenumber = true,
			width = 40,
			side = "right",
			hide_root_folder = true,
			mappings = {
				custom_only = false, -- `custom_only = false` will merge list of mappings with defaults
				list = {
					{
						key = "-",
						action = "",
					},
				},
			},
		},
		live_filter = {
			always_show_folders = false,
		},
		-- update_cwd = true,
		update_focused_file = {
			enable = true,
			-- update_cwd = true,
		},
	})
end
