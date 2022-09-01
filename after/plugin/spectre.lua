local status, spectre = pcall(require, "spectre")
if not status then
	return
end

spectre.setup({
	color_devicons = true,
	live_update = true,
	-- open_cmd = "new",
	highlight = {
		ui = "String",
		search = "Keyword",
		replace = "Operator",
	},
	mapping = {
		["toggle_line"] = {
			map = "d",
			cmd = "<cmd>lua require('spectre').toggle_line()<CR>",
			desc = "> Toggle current item",
		},
		["run_current_replace"] = {
			map = "r",
			cmd = "<cmd>lua require('spectre.actions').run_current_replace()<CR>",
			desc = "> Replace current line",
		},
		["run_replace"] = {
			map = "R",
			cmd = "<cmd>lua require('spectre.actions').run_replace()<CR>",
			desc = "> Replace all",
		},
		["change_view_mode"] = {
			map = "v",
			cmd = "<cmd>lua require('spectre').change_view()<CR>",
			desc = "> Change result view mode",
		},
	},
})
