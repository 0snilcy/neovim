local g = {
	mapleader = " ",
	maplocalleader = " ",
	loaded_perl_provider = 0,
	loaded_ruby_provider = 0,

	-- netrw_banner = 0, -- Hide banner
	-- netrw_browse_split = 4, -- Open in previous window
	-- netrw_altv = 1, -- Open with right splitting
	-- netrw_liststyle = 3, -- Tree-style view
	-- netrw_list_hide = (fn["netrw_gitignore#Hide"]()) .. [[,\(^\|\s\s\)\zs\.\S\+]], -- use .gitignore
}

for key, val in pairs(g) do
	-- vim.g[key] = val
	vim.api.nvim_set_var(key, val)
end
