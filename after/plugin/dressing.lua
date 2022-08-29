local status, dressing = pcall(require, "dressing")
if not status then
	return
end

dressing.setup({
	select = {
		backend = { "telescope", "fzf", "builtin" },
	},
})
