local status, nvim_treesitter = pcall(require, "nvim-treesitter.configs")
if not status then
	return
end

nvim_treesitter.setup({
	ensure_installed = "all",
	sync_install = false,
	auto_install = false,
	ignore_install = {},
	disable = {},
	highlight = {
		enable = true,
	},
	indent = {
		enable = false,
	},
	rainbow = {
		enable = true,
		extended_mode = true,
	},
	incremental_selection = {
		enable = true,
	},
	textobjects = {
		enable = true,
	},
})

-- vim.opt.foldmethod     = 'expr'
-- vim.opt.foldexpr       = 'nvim_treesitter#foldexpr()'
---WORKAROUND
vim.api.nvim_create_autocmd({ "BufEnter", "BufAdd", "BufNew", "BufNewFile", "BufWinEnter" }, {
	group = vim.api.nvim_create_augroup("TS_FOLD_WORKAROUND", {}),
	callback = function()
		vim.opt.foldmethod = "expr"
		vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
	end,
})
---ENDWORKAROUND
