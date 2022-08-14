local status, cinnamon = pcall(require, "cinnamon")
if not status then
	return
end

cinnamon.setup({})
