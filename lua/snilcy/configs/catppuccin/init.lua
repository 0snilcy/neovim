local M = {}
local lspsage_palette = require("snilcy.configs.catppuccin.colors.lspsaga")
local cp = require("catppuccin.palettes").get_palette() -- fetch colors from palette
cp.none = "NONE"

-- require("catppuccin.lib.highlighter").editor({})

local plugin_colors = {
	NormalFloat = { bg = cp.none },
}

function M.setup()
	require("catppuccin").setup({
		custom_highlights = vim.tbl_deep_extend("force", {}, lspsage_palette, plugin_colors),
		-- dim_inactive = {
		-- 	enabled = false,
		-- 	shade = "dark",
		-- 	percentage = 0.15,
		--  },
		transparent_background = false,
		term_colors = false,
		-- compile = {
		-- 	enabled = false,
		-- 	-- path = vim.fn.stdpath "cache" .. "/catppuccin",
		-- },
		styles = {
			comments = {
				"italic",
			},
			conditionals = {
				"italic",
			},
			loops = {},
			functions = {},
			keywords = {},
			strings = {},
			variables = {},
			numbers = {},
			booleans = {},
			properties = {},
			types = {},
			operators = {},
		},
		integrations = {
			-- treesitter = true,
			native_lsp = {
				enabled = true,
				virtual_text = {
					errors = {
						"italic",
					},
					hints = {
						"italic",
					},
					warnings = {
						"italic",
					},
					information = {
						"italic",
					},
				},
				underlines = {
					errors = {
						"underline",
					},
					hints = {
						"underline",
					},
					warnings = {
						"underline",
					},
					information = {
						"underline",
					},
				},
			},
			-- coc_nvim = false,
			lsp_trouble = true,
			cmp = true,
			-- lsp_saga = true,
			-- gitgutter = false,
			-- gitsigns = true,
			-- leap = false,
			telescope = true,
			nvimtree = {
				enabled = true,
				-- 	show_root = true,
				transparent_panel = true,
			},
			-- neotree = {
			-- 	enabled = false,
			-- 	show_root = true,
			-- 	transparent_panel = false,
			--  },
			-- dap = {
			-- 	enabled = false,
			-- 	enable_ui = false,
			--  },
			which_key = true,
			-- indent_blankline = {
			-- 	enabled = true,
			-- 	colored_indent_levels = false,
			--  },
			-- dashboard = true,
			-- neogit = false,
			-- vim_sneak = false,
			-- fern = false,
			-- barbar = false,
			bufferline = true,
			-- markdown = true,
			lightspeed = true,
			-- ts_rainbow = false,
			hop = true,
			-- notify = true,
			-- telekasten = true,
			-- symbols_outline = true,
			-- mini = false,
			-- aerial = false,
			-- vimwiki = false,
			-- beacon = false,
		},
	})

	vim.g.catppuccin_flavour = "frappe" -- latte, frappe, macchiato, mocha
	vim.cmd([[colorscheme catppuccin]])
end

return M
