local status, autopairs = pcall(require, "nvim-autopairs")
local status, autopairs = pcall(require, "nvim-autopairs")
if not status then
	return
end

autopairs.setup({
	check_ts = true,
})
if not status then
	return
end

autopairs.setup({
	check_ts = true,
})
