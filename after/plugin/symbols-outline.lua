local status, symbols = pcall(require, "symbols-outline")
if not status then
	return
end

symbols.setup({
	auto_close = true,
})
