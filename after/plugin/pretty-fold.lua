local status, fold = pcall(require, "pretty-fold")
if not status then
	return
end

fold.setup({
	sections = {
		left = {
			"content",
			"  «   ",
			"number_of_folded_lines",
			":",
			"percentage",
		},
		right = {},
	},
	fill_char = " ",
})
