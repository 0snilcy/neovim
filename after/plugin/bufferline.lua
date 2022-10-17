local status, bufferline = pcall(require, "bufferline")
if not status then
	return
end

-- vim.opt.termguicolors = true

-- local cp = require("catppuccin.palettes").get_palette()
local groups = require("bufferline.groups")
local cp = require("kanagawa.colors").setup()

bufferline.setup({
	options = {
		name_formatter = function(buf) -- buf contains:
			-- name                | str        | the basename of the active file
			-- path                | str        | the full path of the active file
			-- bufnr (buffer only) | int        | the number of the active buffer
			-- buffers (tabs only) | table(int) | the numbers of the buffers in the tab
			-- tabnr (tabs only)   | int        | the "handle" of the tab, can be converted to its ordinal number using: `vim.api.nvim_tabpage_get_number(buf.tabnr)`
			-- dump(buf)
		end,
		groups = {
			items = {
				{
					name = "zsh",
					priority = 1,
					matcher = function(buf) -- Mandatory
						return buf.path:match("^term://")
					end,
				},
				groups.builtin.ungrouped,
			},
		},
		themable = true,
		numbers = "none",
		diagnostics = false,
		-- diagnostics_indicator = function(count, level)
		-- 	local icon = level:match("error") and " " or ""
		-- 	return " " .. icon .. count
		-- end,
		separator_style = {}, -- "slant" | "thick" | "thin" | { 'any', 'any' },
		show_buffer_close_icons = false,
		show_close_icon = false,
		show_buffer_icons = true,
		show_tab_indicators = true,
		always_show_bufferline = true,
		tab_size = 0,
		-- indicator_icon = "|",
		-- separator_style = "slant",
		offsets = {
			-- {
			-- 	filetype = "NvimTree",
			-- 	text = "File Explorer",
			-- 	text_align = "center",
			-- },
		},
		indicator = {
			style = "none",
		},
		-- left_trunc_marker = "",
		-- right_trunc_marker = "",
	},
	highlights = {
		background = {
			fg = cp.springViolet1,
		},
		separator = {
			fg = cp.springViolet1,
		},
	},
})
