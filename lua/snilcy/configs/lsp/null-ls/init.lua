local M = {}

local nls = require("null-ls")
local nls_utils = require("null-ls.utils")
local b = nls.builtins

local with_diagnostics_code = function(builtin)
	return builtin.with({
		diagnostics_format = "#{m} [#{c}]",
	})
end

local with_root_file = function(builtin, file)
	return builtin.with({
		condition = function(utils)
			return utils.root_has_file(file)
		end,
	})
end

local with_root_pattern = function(builtin, pattern)
	return builtin.with({
		condition = function(utils)
			return utils.root_matches(pattern)
		end,
	})
end

local sources = {
	-- "go", "javascript", "lua", "python", "typescript"
	b.code_actions.refactoring,

	-- shell
	-- b.formatting.shfmt,
	b.formatting.beautysh,
	with_diagnostics_code(b.diagnostics.shellcheck),
	with_diagnostics_code(b.diagnostics.zsh),

	-- js
	with_root_file(b.formatting.prettier, {
		".prettierrc",
		".prettierrc.json",
		".prettierrc.yml",
		".prettierrc.yaml",
		".prettierrc.json5",
		".prettierrc.js",
		".prettierrc.cjs",
		".prettierrc.toml",
		".prettier.config.js",
		".prettier.config.cjs",
	}),
	b.diagnostics.eslint_d,
	b.code_actions.eslint_d,
	b.formatting.eslint_d,
	b.diagnostics.tsc,
	-- b.code_actions.xo, -- JavaScript/TypeScript linter (ESLint wrapper) with great defaults

	-- json
	-- b.formatting.fixjson,

	-- python
	-- b.formatting.black.with {
	-- 	extra_args = {
	-- 		"--fast",
	-- 	 },
	-- },
	-- b.formatting.isort,
	-- b.diagnostics.flake8,

	-- lua
	with_root_file(b.formatting.stylua, "stylua.toml"),
	with_root_file(b.diagnostics.selene, "selene.toml"),
	-- b.diagnostics.selene.with({
	-- 	cwd = function()
	-- 		return vim.fs.dirname(vim.fs.find({ "selene.toml" }, { upward = true, path = vim.api.nvim_buf_get_name(0) })[1])
	-- 			or vim.fn.expand("~/.config/selene/") -- fallback value
	-- 	end,
	-- }),

	-- spell
	-- b.diagnostics.write_good, -- English prose linter
	-- b.code_actions.proselint, -- An English prose linter

	-- b.diagnostics.markdownlint,

	-- code actions
	-- b.code_actions.gitsigns,
	-- b.code_actions.gitrebase,

	-- hover
	-- b.hover.dictionary,
}

function M.setup(opts)
	nls.setup({
		-- debug = true,
		debounce = 150,
		-- diagnostics_format = "#{m}",
		save_after_format = false,
		sources = sources,
		on_attach = opts.on_attach,
		root_dir = nls_utils.root_pattern(".git"),
	})
end

return M
