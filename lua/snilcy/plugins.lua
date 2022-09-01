local vim = vim
local execute = vim.api.nvim_command
local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
	execute("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
	execute("packadd packer.nvim")
end

vim.cmd("packadd packer.nvim")

local packer = require("packer")
local util = require("packer.util")

-- Performance
pcall(require, "impatient")

packer.init({
	auto_reload_compiled = true,
	profile = {
		enable = true,
		threshold = 0, -- the amount in ms that a plugins load time must be over for it to be included in the profile
		package_root = util.join_paths(vim.fn.stdpath("data"), "site", "pack"),
	},
	display = {
		open_fn = function()
			return require("packer.util").float({
				border = "rounded",
			})
		end,
	},
})

packer.startup(function(use)
	use({ "lewis6991/impatient.nvim" })
	use({ "nathom/filetype.nvim" })

	use({ "kyazdani42/nvim-web-devicons" })
	use({ "nvim-lua/plenary.nvim", module = "plenary" })

	use({ "rcarriga/nvim-notify" })
	use({ "nvim-lua/popup.nvim" })
	use({ "stevearc/dressing.nvim" })

	use({ "junegunn/fzf", run = "./install --all" })
	use({ "ibhagwan/fzf-lua" })

	use({ "p00f/nvim-ts-rainbow" })
	use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
	use({ "SmiteshP/nvim-gps" })
	use({ "folke/trouble.nvim" })

	use({ "nvim-lualine/lualine.nvim" })
	use({ "folke/which-key.nvim" })
	use({ "ms-jpq/chadtree", branch = "chad", run = "python3 -m chadtree deps" })

	use({ "catppuccin/nvim", run = ":CatppuccinCompile" })

	use({ "petertriho/nvim-scrollbar", module = "scrollbar" })
	use({ "windwp/nvim-autopairs", module = { "nvim-autopairs.completion.cmp", "nvim-autopairs" } })
	use({ "windwp/nvim-ts-autotag" })
	use({ "numToStr/Comment.nvim" })
	use({ "lukas-reineke/indent-blankline.nvim" })
	use({ "norcalli/nvim-colorizer.lua" })
	use({ "folke/lsp-colors.nvim" })
	use({ "ggandor/lightspeed.nvim" })

	use({ "goolord/alpha-nvim" })
	use({ "Shatur/neovim-session-manager" })

	-- use({ "kevinhwang91/nvim-ufo", requires = "kevinhwang91/promise-async" })
	use({ "anuvyklack/pretty-fold.nvim" })
	use({ "anuvyklack/fold-preview.nvim", requires = "anuvyklack/keymap-amend.nvim" })
	use({ "windwp/nvim-spectre" })
	use({ "simrat39/symbols-outline.nvim" })

	use({ "tpope/vim-fugitive" })
	use({ "idanarye/vim-merginal" })
	use({ "rbong/vim-flog" })
	use({ "TimUntersberger/neogit" })

	use({
		"lvimuser/lsp-inlayhints.nvim",
		config = function()
			require("lsp-inlayhints").setup({})
		end,
	})

	use({
		"nvim-telescope/telescope.nvim",
		-- module = { "telescope", "telescope.builtin" },
		-- keys = { "<leader>b", "<leader>p", "<leader>w" },
		wants = {
			"telescope-file-browser.nvim",
			"telescope-fzf-native.nvim",
		},
		requires = {
			"nvim-telescope/telescope-file-browser.nvim",
			{ "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
			-- "nvim-telescope/telescope-media-files.nvim",
		},
	})

	use({
		"hrsh7th/nvim-cmp",
		requires = {
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			"hrsh7th/cmp-nvim-lsp",
			"ray-x/cmp-treesitter",
			"L3MON4D3/LuaSnip",
			"saadparwaiz1/cmp_luasnip",
			"onsails/lspkind.nvim",
			"hrsh7th/cmp-nvim-lua",
		},
	})

	use({
		"neovim/nvim-lspconfig",
		requires = {
			"folke/lua-dev.nvim",
			"williamboman/nvim-lsp-installer",
			"ray-x/lsp_signature.nvim",
			"RRethy/vim-illuminate", -- automatically highlighting other uses of the word under the cursor
			"ThePrimeagen/refactoring.nvim",
			"jose-elias-alvarez/null-ls.nvim",
			"b0o/schemastore.nvim",
			"jose-elias-alvarez/typescript.nvim",
			"j-hui/fidget.nvim", -- nvim-lsp progress
		},
		config = function()
			require("snilcy.configs.lsp").setup()
		end,
	})

	-- Easy hopping
	-- use({
	-- 	"phaazon/hop.nvim", -- cmd = { "HopWord", "HopChar1" },
	-- 	config = function()
	-- 		require("hop").setup({})
	-- 	end,
	-- })

	-- use({ "mg979/vim-visual-multi" })

	-- use 'wellle/targets.vim'

	-- -- Completion
	-- use {
	--   "ms-jpq/coq_nvim",
	--   branch = "coq",
	--   event = "InsertEnter",
	--   opt = true,
	--   run = ":COQdeps",
	--   config = function()
	--     require("snilcy.configs.coq").setup()
	--   end,
	--   requires = {
	--     { "ms-jpq/coq.artifacts", branch = "artifacts" },
	--     { "ms-jpq/coq.thirdparty", branch = "3p", module = "coq_3p" },
	--   },
	--   -- disable = false,
	-- }

	-- lspsaga.nvim
	-- use {
	-- 	"tami5/lspsaga.nvim",
	-- 	event = "VimEnter",
	-- 	cmd = {
	-- 		"Lspsaga",
	-- 	 },
	-- 	config = function()
	-- 		require("lspsaga").setup {
	-- 			rename_prompt_prefix = "",
	-- 		 }
	-- 	end,
	-- }
end)
