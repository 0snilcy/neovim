local status, indent_blankline = pcall(require, "indent_blankline")
if not status then
	return
end

local g = vim.g
g.indent_blankline_char = "┊"
g.indent_blankline_filetype_exclude = { "help", "packer" }
g.indent_blankline_buftype_exclude = { "terminal", "nofile" }
g.indent_blankline_show_trailing_blankline_indent = false

require("indent_blankline").setup({
	-- show_end_of_line = true,
	-- space_char_blankline = " ",
	char_highlight_list = {
		"IndentBlanklineIndent1",
		"IndentBlanklineIndent2",
		"IndentBlanklineIndent3",
		"IndentBlanklineIndent4",
		"IndentBlanklineIndent5",
		"IndentBlanklineIndent6",
	},
})
