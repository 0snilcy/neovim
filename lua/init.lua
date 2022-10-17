vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

if vim.g.neovide then
	vim.g.neovide_refresh_rate = 144
	vim.g.neovide_transparency = 1
	-- vim.g.neovide_fullscreen = true
	vim.g.neovide_confirm_quit = true
	-- vim.g.neovide_profiler = true
	vim.g.neovide_cursor_trail_size = 0

	vim.opt.guifont = {
		"JetBrainsMono NF",
		":h10",
	}

	vim.keymap.set("", "<A-Enter>", ":lua vim.g.neovide_fullscreen = not vim.g.neovide_fullscreen<CR>")
else
	vim.g.clipboard = {
		name = "win32yank-wsl",
		copy = {
			["+"] = "win32yank -i --crlf",
			["*"] = "win32yank -i --crlf",
		},
		paste = {
			["+"] = "win32yank -o --lf",
			["*"] = "win32yank -o --lf",
		},
		cache_enable = 0,
	}
end
