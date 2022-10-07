local status, vgit = pcall(require, "vgit")
if not status then
	return
end

vgit.setup({
	settings = {
		live_blame = {
			enabled = false,
		},
		authorship_code_lens = {
			-- enabled = false,
		},
	},
})
