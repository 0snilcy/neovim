local M = {}

function M.setup()
	local comment = require("Comment")

	vim.keymap.set("x", "<A-/>", "<esc><cmd>lua require(\"Comment.api\").toggle_linewise_op(vim.fn.visualmode())<cr>")
	vim.keymap.set("n", "<A-/>", "<cmd>lua require(\"Comment.api\").toggle_linewise_op()<cr>")

	comment.setup({
		-- mappings = false
		ignore = "^$",
	})
end

return M
