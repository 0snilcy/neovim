local status, diffview = pcall(require, "diffview")
if not status then
	return
end

diffview.setup({
	view = {
		default = {
			-- layout = "diff3_mixed",
		},
		file_history = {},
	},
	enhanced_diff_hl = true,
})
