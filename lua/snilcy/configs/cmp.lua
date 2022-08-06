local M = {}

vim.o.completeopt = "menu,menuone,noselect"

function M.setup()
	-- local has_words_before = function()
	-- 	local line, col = unpack(vim.api.nvim_win_get_cursor(0))
	-- 	return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
	-- end

	local luasnip = require("luasnip")
	local cmp = require("cmp")

	if not cmp then
		return
	end
	-- local use_lsp_config = false
	local lspkind = require("lspkind")

	-- local lsp_config_full = {
	-- 	config = {
	-- 		sources = {
	-- 			-- { name = "nvim_lsp" }
	-- 		},
	-- 	},
	-- }

	local default_config = {
		{ name = "nvim_lsp" },
		{ name = "buffer" },
		{ name = "path" },
		{ name = "nvim_lua" },
		{ name = "treesitter" },
		{ name = "luasnip" },
		-- { name = "nvim_lsp_signature_help" },
		-- { name = "spell" },
		-- { name = "emoji" },
		-- { name = "calc" },
	}

	-- local default_config_full = {
	-- 	config = {
	-- 		sources = default_config,
	-- 	},
	-- }

	cmp.setup({
		completion = {
			completeopt = "menu,menuone,noinsert",
			keyword_length = 1,
		},
		experimental = {
			native_menu = false,
			ghost_text = false,
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
						luasnip = "[Snip]",
						nvim_lua = "[Lua]",
						treesitter = "[Treesitter]",
						path = "[Path]",
						nvim_lsp_signature_help = "[Signature]",
					})[entry.source.name]
					return vim_item
				end,
			}),
		},
		mapping = {
			["<C-k>"] = cmp.mapping(cmp.mapping.select_prev_item(), {
				"i",
				"c",
			}),
			["<C-j>"] = cmp.mapping(cmp.mapping.select_next_item(), {
				"i",
				"c",
			}),
			["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), {
				"i",
				"c",
			}),
			["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(4), {
				"i",
				"c",
			}),
			-- ["<C-Space>"] = cmp.mapping(function()
			-- 	use_lsp_config = not use_lsp_config
			-- 	return cmp.complete(use_lsp_config and lsp_config_full or default_config_full)
			-- end),
			["<C-e>"] = cmp.mapping(cmp.mapping.close(), {
				"i",
				"c",
				"n",
			}),

			["<CR>"] = cmp.mapping({
				i = cmp.mapping.confirm({
					behavior = cmp.ConfirmBehavior.Replace,
					select = false,
				}),
				c = function(fallback)
					if cmp.visible() then
						cmp.confirm({
							behavior = cmp.ConfirmBehavior.Replace,
							select = false,
						})
					else
						fallback()
					end
				end,
			}),
			["<Tab>"] = cmp.mapping(function(fallback)
				if cmp.visible() then
					cmp.confirm({
						behavior = cmp.ConfirmBehavior.Replace,
						select = false,
					})
				else
					fallback()
				end
			end, {
				"i",
				"s",
				"c",
			}),
			["<S-Tab>"] = cmp.mapping(function(fallback)
				if cmp.visible() then
					cmp.select_prev_item()
				elseif luasnip.jumpable(-1) then
					luasnip.jump(-1)
				else
					fallback()
				end
			end, {
				"i",
				"s",
				"c",
			}),
		},
		sources = default_config,
		window = {
			documentation = cmp.config.window.bordered(),
		},
	})

	-- Use buffer source for `/`
	cmp.setup.cmdline("/", {
		sources = {
			{
				name = "buffer",
			},
		},
	})

	-- Use cmdline & path source for ':'
	cmp.setup.cmdline(":", {
		sources = cmp.config.sources({
			{
				name = "path",
			},
		}, {
			{
				name = "cmdline",
			},
		}),
	})

	-- -- Auto pairs
	local cmp_autopairs = require("nvim-autopairs.completion.cmp")
	cmp.event:on(
		"confirm_done",
		cmp_autopairs.on_confirm_done({
			map_char = {
				tex = "",
			},
		})
	)
end

return M
