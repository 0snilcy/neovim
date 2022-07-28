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
		-- ["w"] = {
		-- 	":update!<CR>",
		-- 	"Save",
		--  },
		-- ["q"] = {
		-- 	":q!<CR>",
		-- 	"Quit",
		--  },

		s = {
			name = "System",
			c = {
				":PackerCompile<CR>",
				"Compile",
			},
			i = {
				":PackerInstall<CR>",
				"Install",
			},
			s = {
				":PackerSync<CR>",
				"Sync",
			},
			t = {
				":PackerStatus<CR>",
				"Status",
			},
			u = {
				":PackerUpdate<CR>",
				"Update",
			},
			d = {
				":NullLsInfo<CR>",
				"Diagnostics Servers",
			},
			l = {
				":LspInfo<CR>",
				"LSP Servers",
			},
		},

		b = {
			name = "Buffer",
			-- r = {
			-- 	":BufferLineCloseRight<CR>",
			-- 	"CloseRight",
			--  },
			-- l = {
			-- 	":BufferLineCloseLeft<CR>",
			-- 	"CloseLeft",
			--  },
			w = {
				":%bd|e#|bd#<CR>",
				"Delete all buffers",
			},
			o = {
				":BufferLineCloseRight<CR>:BufferLineCloseLeft<CR>",
				"Close Others",
			},
			d = {
				":Trouble document_diagnostics<CR>",
				"Diagnostics",
			},
			f = {
				":lua vim.lsp.buf.formatting()<CR>",
				"Format",
			},
			s = {
				":Telescope lsp_document_symbols<CR>",
				"Symbols",
			},
			g = {
				":Telescope current_buffer_fuzzy_find<CR>",
				"Grep",
			},
		},

		p = {
			name = "Project",
			l = {
				":Telescope projects<CR>",
				"List",
			},
			-- s = {
			-- 	":Telescope repo list<cr>",
			-- 	"Search",
			--  },
			b = {
				":lua require('utils.finder').find_buffers()<CR>",
				"Buffers grep",
			},
			f = {
				":lua require('utils.finder').find_files()<CR>",
				"File search",
			},
			F = {
				":Telescope file_browser<CR>",
				"File browser",
			},
			a = {
				":NvimTreeRefresh<CR>:NvimTreeOpen<CR>",
				"Sidebar",
			},
			g = {
				":Telescope live_grep<CR>",
				"Grep",
			},
			s = {
				":Telescope lsp_dynamic_workspace_symbols<CR>",
				"Symbols",
			},
			d = {
				":Trouble workspace_diagnostics<CR>",
				"Diagnostics",
			},
		},

		h = {
			name = "Hop",
			c = {
				":HopChar1",
				"Char",
			},
			-- w = { ":HopWor", "Char" },
		},

		w = {
			name = "Word",
			-- h = {
			-- 	":lua vim.lsp.buf.signature_help()<CR>",
			-- 	"Signature Help",
			--  },
			-- a = {
			-- 	":Telescope lsp_code_actions<CR>",
			-- 	"Code Action",
			--  },
			i = {
				":lua vim.lsp.buf.implementation()<CR>",
				"Goto Implementation (1) Idea",
			},
			D = {
				":lua vim.lsp.buf.declaration()<CR>",
				"Declaration (2) Types",
			},
			d = {
				":lua vim.lsp.buf.definition()<CR>",
				"Definition (3) Value",
			},
			T = {
				":lua vim.lsp.buf.type_definition()<CR>",
				"Goto Type Definition",
			},
			r = {
				":lua vim.lsp.buf.rename()<CR>",
				"Rename",
			},
			l = {
				":Telescope lsp_references initial_mode=normal<CR>",
				"References LSP",
			},
			g = {
				":Telescope grep_string<CR>",
				"Grep word",
			},
			s = {
				":lua require('utils.finder').find_symbol_under_cursor()<CR>",
				"Search symbol",
			},
		},
	}

	whichkey.setup(conf)
	whichkey.register(mappings, opts)
end

return M
