local M = {}

local lsp_signature = require("lsp_signature")
lsp_signature.setup({
	bind = true,
	handler_opts = {
		border = "rounded",
	},
})

local function on_attach(client, bufnr)
	-- Enable completion triggered by <C-X><C-O>
	-- See `:help omnifunc` and `:help ins-completion` for more information.
	-- vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

	-- Use LSP as the handler for formatexpr.
	-- See `:help formatexpr` for more information.
	vim.api.nvim_buf_set_option(0, "formatexpr", "v:lua.vim.lsp.formatexpr()")

	-- require("snilcy.configs.lsp.keymaps").setup(client, bufnr)

	require("snilcy.configs.lsp.highlighting").setup(client)
	require("snilcy.configs.lsp.null-ls.formatters").setup(client, bufnr)

	if client.name == "tsserver" then
		require("typescript").setup()
	end
end

local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())

local opts = {
	on_attach = on_attach,
	capabilities = capabilities,
	flags = {
		debounce_text_changes = 150,
	},
}

require("snilcy.configs.lsp.handlers").setup()

function M.setup()
	require("snilcy.configs.lsp.null-ls").setup(opts)
	require("snilcy.configs.lsp.installer").setup(opts)
end

return M
