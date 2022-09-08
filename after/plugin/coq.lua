vim.g.coq_settings = {
	auto_start = "shut-up",
	keymap = {
		recommended = false,
		jump_to_mark = "<C-n>",
	},
	match = {
		max_results = 12,
	},
}

local status, coq = pcall(require, "coq")
if not status then
	return
end

local map = vim.api.nvim_set_keymap
local autopairs = require("nvim-autopairs")

-- 3party sources
require("coq_3p")({
	{ src = "nvimlua", short_name = "nLUA", conf_only = false }, -- Lua
	-- { src = "bc", short_name = "MATH", precision = 6 }, -- Calculator
	-- { src = "cow", trigger = "!cow" }, -- cow command
	-- { src = "figlet", trigger = "!big" }, -- figlet command
	-- {
	-- 	src = "repl",
	-- 	sh = "zsh",
	-- 	shell = { p = "perl", n = "node" },
	-- 	max_lines = 99,
	-- 	deadline = 500,
	-- 	unsafe = { "rm", "poweroff", "mv" },
	-- },
})

autopairs.setup({ map_bs = false, map_cr = false })

local opts = { expr = true, noremap = true }

-- these mappings are coq recommended mappings unrelated to nvim-autopairs
map("i", "<esc>", [[pumvisible() ? "<c-e><esc>" : "<esc>"]], opts)
map("i", "<c-c>", [[pumvisible() ? "<c-e><c-c>" : "<c-c>"]], opts)
map("i", "<tab>", [[pumvisible() ? "<c-n>" : "<tab>"]], opts)
map("i", "<s-tab>", [[pumvisible() ? "<c-p>" : "<bs>"]], opts)

function _G.CR()
	if vim.fn.pumvisible() ~= 0 then
		if vim.fn.complete_info({ "selected" }).selected ~= -1 then
			return autopairs.esc("<c-y>")
		else
			return autopairs.esc("<c-e>") .. autopairs.autopairs_cr()
		end
	else
		return autopairs.autopairs_cr()
	end
end

function _G.CR()
	if vim.fn.pumvisible() ~= 0 and vim.fn.complete_info({ "mode" }).mode == "eval" then
		return autopairs.esc("<c-e>") .. autopairs.autopairs_bs()
	else
		return autopairs.autopairs_bs()
	end
end

map("i", "<cr>", "v:lua.CR()", opts)
map("i", "<bs>", "v:lua.BS()", opts)
