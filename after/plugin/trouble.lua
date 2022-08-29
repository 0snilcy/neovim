local status, trouble = pcall(require, "trouble")
if not status then
	return
end

trouble.setup({
	padding = false,
	use_diagnostic_signs = false,
	height = 20,
	-- auto_open = true,
	auto_close = true,
	auto_preview = true,
})
