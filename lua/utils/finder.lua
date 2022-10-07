local M = {}

-- Find a file either using git files or search the filesystem.
function M.find_files()
	local telescope = require("telescope.builtin")
	local themes = require("telescope.themes")

	local opts = {
		hidden = true,
		show_untracked = true,
		search_dirs = {
			vim.fn.getcwd(),
		},

		sorting_strategy = "ascending",

		layout_strategy = "bottom_pane",
		layout_config = {
			height = 25,
		},

		border = true,
		borderchars = {
			prompt = { "─", " ", " ", " ", "─", "─", " ", " " },
			results = { " " },
			preview = { " " },
			-- preview = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
		},
	}

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

function M.replace_buffer_word()
	require("spectre").open({
		search_text = vim.fn.expand("<cword>"),
		path = vim.fn.fnameescape(vim.fn.expand("%:p:.")),
	})
end

return M
