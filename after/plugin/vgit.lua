local status, vgit = pcall(require, "vgit")
if not status then
	return
end

vgit.setup({
	live_blame = {
		enables = false,
	},
})
