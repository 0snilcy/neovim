local M = {}

function M.setup()
	local comment = require("Comment")

	vim.keymap.set("x", "<A-/>", ":lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>")
	vim.keymap.set("n", "<A-/>", ":lua require('Comment.api').toggle.linewise()<CR>")

	comment.setup({
		ignore = "^$",
	})
end

return M
