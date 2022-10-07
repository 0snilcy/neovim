vim.g.did_load_filetypes = 0

vim.filetype.add({
	extension = {
		sh = "shell",
	},
})

-- require("snilcy.settings.filetype")
require("snilcy.settings.events")
require("snilcy.settings.keymaps")
require("snilcy.settings.options")
require("snilcy.settings.vars")
