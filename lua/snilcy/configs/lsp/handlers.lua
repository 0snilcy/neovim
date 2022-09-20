local M = {}

local format = {
	[vim.diagnostic.severity.ERROR] = "",
	[vim.diagnostic.severity.WARN] = "",
	[vim.diagnostic.severity.INFO] = "",
	[vim.diagnostic.severity.HINT] = "",
}

function M.setup()
	-- LSP handlers configuration
	local float_config = {
		focusable = true,
		style = "minimal",
		border = "rounded",
	}

	local diagnostic_config = {
		virtual_text = {
			spacing = 0,
			prefix = "",
			format = function(diagnostic)
				-- return string.format("%s %s", format[diagnostic.severity], diagnostic.code)
				return string.format("<- %s", diagnostic.code)
				-- return string.format("[%s]", diagnostic.source, diagnostic.message, diagnostic.code)
			end,
		},
		source = true,
		signs = true,
		underline = true,
		update_in_insert = false,
		severity_sort = true,
		float = float_config,
	}

	-- Diagnostic signs
	local diagnostic_signs = {

		{
			name = "DiagnosticSignError",
			text = "",
		},
		{
			name = "DiagnosticSignWarn",
			text = "",
		},
		{
			name = "DiagnosticSignHint",
			text = "",
		},
		{
			name = "DiagnosticSignInfo",
			text = "",
		},
	}

	for _, sign in ipairs(diagnostic_signs) do
		vim.fn.sign_define(sign.name, {
			texthl = sign.name,
			text = sign.text,
			numhl = sign.name,
		})
	end

	-- Diagnostic configuration
	vim.diagnostic.config(diagnostic_config)

	-- Hover configuration
	vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, float_config)

	-- Signature help configuration
	vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, float_config)
end

return M
