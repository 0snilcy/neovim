local status, cmp = pcall(require, "cmp")
if not status or not cmp then
  return
end

local MAX_POPUP_ITEMS = 15

vim.o.completeopt = "menu,menuone,noselect"
vim.o.pumheight = MAX_POPUP_ITEMS

local luasnip = require("luasnip")
local lspkind = require("lspkind")
local cmp_autopairs = require("nvim-autopairs.completion.cmp")

-- TODO: Doesn't work
require("snilcy.configs.cmp.snippets")
require("luasnip.loaders.from_vscode").lazy_load()

local ignored_filetypes = {
  "spectre_panel",
  "conf",
  "tmux",
  "zsh",
  "sh",
}

local default_config = {
  { name = "nvim_lsp" },
  -- { name = "nvim_lsp_signature_help" },
  { name = "nvim_lua" },
  { name = "buffer" },
  { name = "path" },
  -- { name = "treesitter" },
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
    keyword_length = 1,
  },
  experimental = {
    -- native_menu = true,
    ghost_text = true,
  },
  view = {
    -- entries = "native"
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
        -- vim_item.menu = ({
        --   nvim_lsp = "[LSP]",
        --   buffer = "[Buffer]",
        --   treesitter = "[Treesitter]",
        --   luasnip = "[Snip]",
        --   nvim_lua = "[Lua]",
        --   path = "[Path]",
        --   nvim_lsp_signature_help = "[Signature]",
        -- })[entry.source.name]
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
    documentation = cmp.config.window.bordered({
      zindex = 1000,
      winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:Visual,Search:None",
    }),
    completion = cmp.config.window.bordered({
      zindex = 1000,
      winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:Visual,Search:None",
    }),
  },
})

-- Use buffer source for `/`
cmp.setup.cmdline("/", {
  enabled = true,
  sources = {
    { name = "buffer" },
  },
})

-- Use cmdline & path source for ':'
cmp.setup.cmdline(":", {
  enabled = true,
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

-- cmp.setup.filetype(enabled_filetypes, {
-- 	enabled = true,
-- })
