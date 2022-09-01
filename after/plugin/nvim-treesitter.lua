local status, nvim_treesitter = pcall(require, "nvim-treesitter.configs")
if not status then
	return
end

nvim_treesitter.setup({
	ensure_installed = "all",
	sync_install = false,
	highlight = {
		enable = true,
	},
	indent = {
		enable = true,
	},
	rainbow = {
		enable = true,
		extended_mode = true,
	},
})
