local status, fidget = pcall(require, "fidget")
if not status then
	return
end

fidget.setup({
	text = {
		spinner = "moon",
	},
	window = {
		blend = 0,
	},
})
