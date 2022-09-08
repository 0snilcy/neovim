local status, cmp = pcall(require, "cmp")
if not status or not cmp then
	return
end

local ONLY_VIRTUAL_TEXT = false
local MAX_POPUP_ITEMS = 7

vim.o.completeopt = "menu,menuone,noselect"
vim.o.pumheight = MAX_POPUP_ITEMS

local lspkind = require("lspkind")
local luasnip = require("luasnip")
local cmp_autopairs = require("nvim-autopairs.completion.cmp")

local ignored_filetypes = {
	"spectre_panel",
}

local default_config = {
	{ name = "nvim_lsp" },
	{ name = "nvim_lsp_signature_help" },
	{ name = "nvim_lua" },
	{ name = "buffer" },
	{ name = "path" },
	{ name = "treesitter" },
	{ name = "luasnip" },
}

local has_words_before = function()
	local line, col = unpack(vim.api.nvim_win_get_cursor(0))
	return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

---@diagnostic disable-next-line: redundant-parameter
cmp.setup({
	completion = {
		-- completeopt = "menu,menuone,noinsert",
		-- autocomplete = false
		keyword_length = 2,
	},
	experimental = {
		-- native_menu = true,
		ghost_text = true,
	},
	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body)
		end,
	},
	matching = {
		disallow_fuzzy_matching = true,
	},
	formatting = {
		format = lspkind.cmp_format({
			mode = "symbol_text", -- show only symbol annotations { "text", "text_symbol", "symbol_text", "symbol" }
			maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)

			-- The function below will be called before any actual modifications from lspkind
			-- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
			before = function(entry, vim_item)
				vim_item.menu = ({
					nvim_lsp = "[LSP]",
					buffer = "[Buffer]",
					treesitter = "[Treesitter]",
					luasnip = "[Snip]",
					nvim_lua = "[Lua]",
					path = "[Path]",
					nvim_lsp_signature_help = "[Signature]",
				})[entry.source.name]
				return vim_item
			end,
		}),
	},
	mapping = {
		["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
		["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
		["<C-e>"] = cmp.mapping(cmp.mapping.close(), { "i", "c", "n" }),
		["<Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item({
					behavior = cmp.SelectBehavior.Select,
				})
			elseif luasnip.expand_or_jumpable() then
				luasnip.expand_or_jump()
			elseif has_words_before() then
				cmp.complete()
			else
				fallback()
			end
		end, { "i", "s", "c" }),
		["<S-Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item({
					behavior = cmp.SelectBehavior.Select,
				})
			elseif luasnip.jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end, { "i", "s", "c" }),
		["<CR>"] = cmp.mapping({
			i = cmp.mapping.confirm({
				behavior = cmp.ConfirmBehavior.Replace,
			}),
			c = cmp.mapping.confirm({
				behavior = cmp.ConfirmBehavior.Replace,
				-- select = true,
			}),
		}),
	},
	sources = default_config,
	window = {
		documentation = cmp.config.window.bordered({ zindex = 10000 }),
		completion = cmp.config.window.bordered({ zindex = 10000 }),
	},
})

-- Use buffer source for `/`
cmp.setup.cmdline("/", {
	sources = {
		{ name = "buffer" },
	},
})

-- Use cmdline & path source for ':'
cmp.setup.cmdline(":", {
	sources = cmp.config.sources({
		{ name = "path" },
	}, {
		{ name = "cmdline" },
	}),
})

cmp.event:on(
	"confirm_done",
	cmp_autopairs.on_confirm_done({
		map_char = {
			tex = "",
		},
	})
)

cmp.setup.filetype(ignored_filetypes, {
	enabled = false,
})

-- if ONLY_VIRTUAL_TEXT then
-- 	local is_complete_open = false
-- 	local win_ids = {}

-- 	_G.CMP_CALLBACK = function()
-- 		if not is_complete_open then
-- 			return
-- 		end
-- 		for win_id, params in pairs(win_ids) do
-- 			vim.api.nvim_win_set_config(win_id, params.config)
-- 			vim.api.nvim_win_set_option(win_id, "winhighlight", params.winhighlight)
-- 		end
-- 	end

-- 	vim.api.nvim_set_keymap("i", "<C-k>", "<CMD>lua CMP_CALLBACK()<CR>", {})

-- 	cmp.event:on("menu_opened", function(data)
-- 		is_complete_open = true
-- 		for _, value in pairs(data) do
-- 			local win = value.entries_win
-- 			local win_id = win.win
-- 			local buf_id = vim.api.nvim_win_get_buf(win_id)
-- 			local buf_lines_count = vim.api.nvim_buf_line_count(buf_id)

-- 			win_ids[win_ids] = {
-- 				config = vim.api.nvim_win_get_config(win_id),
-- 				winhighlight = vim.api.nvim_win_get_option(win_id, "winhighlight"),
-- 			}

-- 			vim.api.nvim_win_set_config(win_id, {
-- 				height = (MAX_POPUP_ITEMS > buf_lines_count) and MAX_POPUP_ITEMS or buf_lines_count,
-- 				width = 1,
-- 				border = "none",
-- 			})
-- 			vim.api.nvim_win_set_option(win_id, "winhighlight", "CursorLine:None")
-- 		end
-- 	end)

-- 	cmp.event:on("menu_closed", function()
-- 		is_complete_open = false
-- 	end)
-- end
