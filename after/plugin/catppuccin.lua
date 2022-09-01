local status, catppuccin = pcall(require, "catppuccin")
if not status then
	return
end

-- local color_palette = {
-- 	rosewater = "#F5E0DC",
-- 	flamingo = "#F2CDCD",
-- 	pink = "#F5C2E7",
-- 	mauve = "#CBA6F7",
-- 	red = "#F38BA8",
-- 	maroon = "#EBA0AC",
-- 	peach = "#FAB387",
-- 	yellow = "#F9E2AF",
-- 	green = "#A6E3A1",
-- 	teal = "#94E2D5",
-- 	sky = "#89DCEB",
-- 	sapphire = "#74C7EC",
-- 	blue = "#89B4FA",
-- 	lavender = "#B4BEFE",

-- 	text = "#CDD6F4",
-- 	subtext1 = "#BAC2DE",
-- 	subtext0 = "#A6ADC8",
-- 	overlay2 = "#9399B2",
-- 	overlay1 = "#7F849C",
-- 	overlay0 = "#6C7086",
-- 	surface2 = "#585B70",
-- 	surface1 = "#45475A",
-- 	surface0 = "#313244",

-- 	base = "#1E1E2E",
-- 	mantle = "#181825",
-- 	crust = "#11111B",
-- }

local ucolors = require("catppuccin.utils.colors")
local lspsage_palette = require("snilcy.configs.catppuccin.colors.lspsaga")
local cp = require("catppuccin.palettes").get_palette()
cp.none = "NONE"

---@diagnostic disable: need-check-nil
local plugin_colors = {
	NormalFloat = { bg = cp.mantle },
	-- String = { bg = cp.red, fg = cp.red },
	Visual = { bg = cp.surface2, style = { "bold" } }, -- Visual mode selection
	VisualNOS = { bg = cp.surface2, style = { "bold" } }, -- Visual mode selection when vim is "Not Owning the Selection".

	rainbowcol1 = { fg = cp.red },
	rainbowcol2 = { fg = cp.teal },
	rainbowcol3 = { fg = cp.yellow },
	rainbowcol4 = { fg = cp.blue },
	rainbowcol5 = { fg = cp.pink },
	rainbowcol6 = { fg = cp.flamingo },
	rainbowcol7 = { fg = cp.green },

	LspInlayHint = { fg = cp.surface2, bg = cp.none },
	Folded = { fg = cp.blue, bg = ucolors.darken(cp.surface0, 0.3, cp.base) },
	FidgetTitle = { fg = cp.surface2 },
	FidgetTask = { fg = cp.surface2 },
}

catppuccin.setup({
	custom_highlights = vim.tbl_deep_extend("force", {}, lspsage_palette, plugin_colors),
	dim_inactive = {
		enabled = false,
		shade = "dark",
		percentage = 0.15,
	},
	transparent_background = true,
	term_colors = true,
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
		treesitter = true,
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
			enabled = false,
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
		-- ts_rainbow = true,
		hop = true,
		-- notify = true,
		-- telekasten = true,
		-- symbols_outline = true,
		-- mini = false,
		-- aerial = false,
		-- vimwiki = false,
		-- beacon = false,
		fidget = true,
	},
})

vim.g.catppuccin_flavour = "mocha" -- latte, frappe, macchiato, mocha
vim.cmd([[colorscheme catppuccin]])
