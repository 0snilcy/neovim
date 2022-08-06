local M = {}

function M.setup()
	local whichkey = require("which-key")

	local conf = {
		window = {
			-- border = "single", -- none, single, double, shadow
			-- position = "bottom", -- bottom, top
		},
		plugins = {
			presets = {
				-- operators = true, -- adds help for operators like d, y, ... and registers them for motion / text object completion
				-- motions = true, -- adds help for motions
				-- text_objects = true, -- help for text objects triggered after entering an operator
				-- windows = true, -- default bindings on <c-w>
				-- nav = true, -- misc bindings to work with windows
				-- z = true, -- bindings for folds, spelling and others prefixed with z
				-- g = true, -- bindings for prefixed with g
			},
		},
	}

	local opts = {
		mode = "n", -- Normal mode
		prefix = "<leader>",
		buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
		silent = false, -- use `silent` when creating keymaps
		noremap = true, -- use `noremap` when creating keymaps
		nowait = false, -- use `nowait` when creating keymaps
	}

	local mappings = {
		s = {
			name = "System",
			c = { ":PackerCompile<CR>", "Compile" },
			i = { ":PackerInstall<CR>", "Install" },
			s = { ":PackerSync<CR>", "Sync" },
			t = { ":PackerStatus<CR>", "Status" },
			u = { ":PackerUpdate<CR>", "Update" },
			d = { ":NullLsInfo<CR>", "Diagnostics Servers" },
			l = { ":LspInfo<CR>", "LSP Servers" },
		},

		b = {
			name = "Buffer",
			w = { ":%bd|e#|bd#<CR>", "Delete all buffers" },
			o = { ":BufferLineCloseRight<CR>:BufferLineCloseLeft<CR>", "Close Others" },
			d = { ":Trouble document_diagnostics<CR>", "Diagnostics" },
			f = { ":lua vim.lsp.buf.formatting()<CR>", "Format" },
			s = { ":Telescope lsp_document_symbols<CR>", "Symbols" },
			g = { ":Telescope current_buffer_fuzzy_find<CR>", "Grep" },
			-- r = { ":BufferLineCloseRight<CR>", "CloseRight" },
			-- l = { ":BufferLineCloseLeft<CR>", "CloseLeft" },
		},

		p = {
			name = "Project",
			l = { ":Telescope projects<CR>", "List" },
			b = { ":lua require('utils.finder').find_buffers()<CR>", "Buffers grep" },
			f = { ":lua require('utils.finder').find_files()<CR>", "File search" },
			F = { ":Telescope file_browser<CR>", "File browser" },
			a = { ":NvimTreeRefresh<CR>:NvimTreeOpen<CR>", "Sidebar" },
			g = { ":Telescope live_grep<CR>", "Grep" },
			s = { ":Telescope lsp_dynamic_workspace_symbols<CR>", "Symbols" },
			d = { ":Trouble workspace_diagnostics<CR>", "Diagnostics" },
			-- s = { ":Telescope repo list<CR>", "Search" },
		},

		h = {
			name = "Hop",
			c = { ":HopChar1", "Char" },
			-- w = { ":HopWor", "Char" },
		},

		w = {
			name = "Word",
			i = { ":lua vim.lsp.buf.implementation()<CR>", "Goto Implementation (1) Idea" },
			D = { ":lua vim.lsp.buf.declaration()<CR>", "Declaration (2) Types" },
			d = { ":lua vim.lsp.buf.definition()<CR>", "Definition (3) Value" },
			T = { ":lua vim.lsp.buf.type_definition()<CR>", "Goto Type Definition" },
			r = { ":lua vim.lsp.buf.rename()<CR>", "Rename" },
			l = { ":Telescope lsp_references initial_mode=normal<CR>", "References LSP" },
			g = { ":Telescope grep_string<CR>", "Grep word" },
			s = { ":lua require('utils.finder').find_symbol_under_cursor()<CR>", "Search symbol" },
			a = { ":lua vim.lsp.buf.code_action()<CR>", "Code Action" },
			-- h = { ":lua vim.lsp.buf.signature_help()<CR>", "Signature Help" },
		},

		d = {
			name = "Debug",
			R = { ":lua require'dap'.run_to_cursor()<CR>", "Run to Cursor" },
			E = { ":lua require'dapui'.eval(vim.fn.input '[Expression] > ')<CR>", "Evaluate Input" },
			C = { ":lua require'dap'.set_breakpoint(vim.fn.input '[Condition] > ')<CR>", "Conditional Breakpoint" },
			U = { ":lua require'dapui'.toggle()<CR>", "Toggle UI" },
			b = { ":lua require'dap'.step_back()<CR>", "Step Back" },
			c = { ":lua require'dap'.continue()<CR>", "Continue" },
			d = { ":lua require'dap'.disconnect()<CR>", "Disconnect" },
			e = { ":lua require'dapui'.eval()<CR>", "Evaluate" },
			g = { ":lua require'dap'.session()<CR>", "Get Session" },
			h = { ":lua require'dap.ui.widgets'.hover()<CR>", "Hover Variables" },
			S = { ":lua require'dap.ui.widgets'.scopes()<CR>", "Scopes" },
			i = { ":lua require'dap'.step_into()<CR>", "Step Into" },
			o = { ":lua require'dap'.step_over()<CR>", "Step Over" },
			p = { ":lua require'dap'.pause.toggle()<CR>", "Pause" },
			q = { ":lua require'dap'.close()<CR>", "Quit" },
			r = { ":lua require'dap'.repl.toggle()<CR>", "Toggle Repl" },
			s = { ":lua require'dap'.continue()<CR>", "Start" },
			t = { ":lua require'dap'.toggle_breakpoint()<CR>", "Toggle Breakpoint" },
			x = { ":lua require'dap'.terminate()<CR>", "Terminate" },
			u = { ":lua require'dap'.step_out()<CR>", "Step Out" },
			-- R = { ":call vimspector#RunToCursor()<CR>", "Run to Cursor" },
			-- c = { ":call vimspector#Continue()<CR>", "Continue" },
			-- i = { ":call vimspector#StepInto()<CR>", "Step Into" },
			-- o = { ":call vimspector#StepOver()<CR>", "Step Over" },
			-- s = { ":call vimspector#Launch()<CR>", "Start" },
			-- t = { ":call vimspector#ToggleBreakpoint()<CR>", "Toggle Breakpoint" },
			-- u = { ":call vimspector#StepOut()<CR>", "Step Out" },
			-- S = { ":call vimspector#Stop()<CR>", "Stop" },
			-- r = { ":call vimspector#Restart()<CR>", "Restart" },
			-- x = { ":VimspectorReset<CR>", "Reset" },
			-- I = { ":VimspectorInstall<CR>", "Install" },
			-- U = { ":VimspectorUpdate<CR>", "Update" },
			-- G = { ":lua require('config.vimspector').generate_debug_profile()<CR>", "Generate Debug Profile" },
			-- H = { ":lua require('config.vimspector').toggle_human_mode()<CR>", "Toggle HUMAN mode" },
		},
	}

	whichkey.setup(conf)
	whichkey.register(mappings, opts)
end

return M
