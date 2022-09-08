local status, bufferline = pcall(require, "bufferline")
if not status then
	return
end

vim.opt.termguicolors = true

local cp = require("catppuccin.palettes").get_palette()

bufferline.setup({
	options = {
		themable = true,
		numbers = "none",
		diagnostics = "none",
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
			-- icon = "",
			style = "none",
		},
		-- left_trunc_marker = "",
		-- right_trunc_marker = "",
	},
	highlights = {
		buffer = {
			fg = cp.red,
			bg = cp.green,
		},
		-- buffer_visible = {
		-- 	fg = cp.red,
		-- 	bg = cp.green,
		-- },
	},
})
