local lsp_installer = require("nvim-lsp-installer")
local lsp_installer_servers = require("nvim-lsp-installer.servers")
local utils = require("utils")

lsp_installer.settings({
	ui = {
		border = "rounded",
	},
})

local servers = {
	gopls = {},
	html = {},
	jsonls = {
		settings = {
			json = {
				schemas = require("schemastore").json.schemas(),
				validate = {
					enable = true,
				},
			},
		},
	},
	pyright = {},
	rust_analyzer = {},
	sumneko_lua = {
		settings = {
			Lua = {
				runtime = {
					-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
					version = "LuaJIT",
				},
				diagnostics = {
					-- Get the language server to recognize the `vim` global
					globals = { "vim", "use" },
				},
				workspace = {
					library = vim.api.nvim_get_runtime_file("", true),
				},
				telemetry = {
					enable = false,
				},
			},
		},
	},
	tsserver = {},
	vimls = {},
}

local M = {}

function M.setup(options)
	for server_name, _ in pairs(servers) do
		local server_available, server = lsp_installer_servers.get_server(server_name)

		if server_available then
			server:on_ready(function()
				local server_settings = servers[server.name]
				local opts = vim.tbl_deep_extend("force", options, server_settings or {})

				-- local coq = require "coq"
				-- server:setup(coq.lsp_ensure_capabilities(opts))

				server:setup(opts or {})
			end)

			if not server:is_installed() then
				utils.info("Installing " .. server.name)
				server:install()
			end
		else
			utils.error(server)
		end
	end
end

return M