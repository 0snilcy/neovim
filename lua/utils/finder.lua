local M = {}

-- Find a file either using git files or search the filesystem.
function M.find_files()
	local opts = {
		hidden = true,
		show_untracked = true,
		search_dirs = {
			vim.fn.getcwd(),
		},
	}
	local telescope = require("telescope.builtin")

	-- local ok = pcall(telescope.git_files, opts)
	-- if not ok then
	telescope.find_files(opts)
	-- end
end

-- Custom find buffers function.
function M.find_buffers()
	require("telescope.builtin").buffers({
		initial_mode = "normal",
	})
end

function M.find_symbol_under_cursor()
	local symbol = vim.fn.expand("<cword>")
	require("telescope.builtin").lsp_workspace_symbols({
		query = symbol,
		prompt_title = "LSP Symbol <" .. symbol .. ">",
		initial_mode = "normal",
	})
end

function M.diagnostics()
	require("telescope.builtin").diagnostics({
		no_sign = false,
		initial_mode = "normal",
	})
end

return M
