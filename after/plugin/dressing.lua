local status, dressing = pcall(require, "dressing")
if not status then
	return
end

dressing.setup({
	input = {
		enabled = true,
	},
	select = {
		enabled = true,
		backend = { "telescope", "fzf", "builtin" },
	},
})
