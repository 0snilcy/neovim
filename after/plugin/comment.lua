local status, comment = pcall(require, "Comment")
if not status then
	return
end

comment.setup({})

vim.keymap.set("x", "<A-/>", ":lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>")
vim.keymap.set("n", "<A-/>", ":lua require('Comment.api').toggle.linewise()<CR>")

comment.setup({
	ignore = "^$",
})
