local M = {}

-- local coq = require("coq") -- add this
-- local lsp_signature = require("lsp_signature")
-- lsp_signature.setup({
-- 	bind = true,
-- 	handler_opts = {
-- 		border = "rounded",
-- 	},
-- })

local function on_attach(client, bufnr)
  -- Enable completion triggered by <C-X><C-O>
  -- See `:help omnifunc` and `:help ins-completion` for more information.
  -- vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

  -- Use LSP as the handler for formatexpr.
  -- See `:help formatexpr` for more information.

  vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
  vim.api.nvim_buf_set_option(bufnr, "formatexpr", "v:lua.vim.lsp.formatexpr()")
  --
  -- tagfunc
  if client.server_capabilities.definitionProvider then
    vim.api.nvim_buf_set_option(bufnr, "tagfunc", "v:lua.vim.lsp.tagfunc")
  end

  require("snilcy.configs.lsp.highlighting").setup(client)
  require("snilcy.configs.lsp.null-ls.formatters").setup(client, bufnr)

  -- require("inlay-hints").on_attach(client, bufnr)
  -- require("aerial").on_attach(client, bufnr)
  require("lsp-inlayhints").on_attach(client, bufnr)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()

capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.foldingRange = {
  dynamicRegistration = false,
  lineFoldingOnly = true,
}
capabilities.textDocument.completion.completionItem.resolveSupport = {
  properties = {
    "documentation",
    "detail",
    "additionalTextEdits",
  },
}

local cmp_capabilities = require("cmp_nvim_lsp").default_capabilities()

local opts = {
  on_attach = on_attach,
  capabilities = cmp_capabilities,
  flags = {
    debounce_text_changes = 150,
  },
}

require("snilcy.configs.lsp.handlers").setup()

function M.setup()
  local servers = require("snilcy.configs.lsp.servers")
  -- require("snilcy.configs.lsp.installer").setup(opts)
  --
  require("snilcy.configs.lsp.null-ls").setup(opts)
  require("snilcy.configs.lsp.handlers").setup()
  require("snilcy.configs.lsp.mason").setup(servers, opts)
end

return M
