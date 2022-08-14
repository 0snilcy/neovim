local status, bufferline = pcall(require, "bufferline")
if not status then
	return
end

bufferline.setup({
	options = {
		themable = true,
		numbers = "none",
		diagnostics = "nvim_lsp",
		-- separator_style = "slant",
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
	},
})
