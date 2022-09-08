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

pcall(require, "impatient") -- Performance

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

-- TODO: Add auto reload
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

	use({ "catppuccin/nvim", run = ":CatppuccinCompile" })

	use({ "p00f/nvim-ts-rainbow" })
	use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
	use({ "SmiteshP/nvim-gps" })

	use({ "nvim-lualine/lualine.nvim" })
	use({ "folke/which-key.nvim" })
	use({ "folke/trouble.nvim" })
	use({ "folke/todo-comments.nvim" })
	use({ "ms-jpq/chadtree", branch = "chad", run = "python3 -m chadtree deps" })
	use({ "ggandor/lightspeed.nvim" })
	use({ "norcalli/nvim-colorizer.lua" })
	use({ "petertriho/nvim-scrollbar", module = "scrollbar" })
	use({ "windwp/nvim-ts-autotag" })
	use({ "numToStr/Comment.nvim" })
	use({ "lukas-reineke/indent-blankline.nvim" })

	use({ "goolord/alpha-nvim" })
	use({ "Shatur/neovim-session-manager" })

	use({ "anuvyklack/pretty-fold.nvim" })
	use({ "anuvyklack/fold-preview.nvim", requires = "anuvyklack/keymap-amend.nvim" })
	use({ "windwp/nvim-spectre" })
	use({ "simrat39/symbols-outline.nvim" })
	use({ "akinsho/bufferline.nvim", tag = "v2.*" })

	use({ "tpope/vim-fugitive" })
	use({ "idanarye/vim-merginal" })
	use({ "rbong/vim-flog" })
	use({ "TimUntersberger/neogit" })

	use({
		"phaazon/hop.nvim",
		config = function()
			require("hop").setup({})
		end,
	})

	use({
		"nvim-telescope/telescope.nvim",
		wants = {
			"telescope-file-browser.nvim",
			"telescope-fzf-native.nvim",
		},
		requires = {
			"nvim-telescope/telescope-file-browser.nvim",
			{ "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
		},
	})

	use({
		"hrsh7th/nvim-cmp",
		requires = {
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-nvim-lua",
			"ray-x/cmp-treesitter",
			"L3MON4D3/LuaSnip",
			"saadparwaiz1/cmp_luasnip",
			"onsails/lspkind.nvim",
			"hrsh7th/cmp-nvim-lua",
			"windwp/nvim-autopairs",
		},
	})

	use({
		"neovim/nvim-lspconfig",
		requires = {
			"folke/lua-dev.nvim",
			"williamboman/nvim-lsp-installer",
			-- "ray-x/lsp_signature.nvim",
			"RRethy/vim-illuminate",
			"ThePrimeagen/refactoring.nvim",
			"jose-elias-alvarez/null-ls.nvim",
			"b0o/schemastore.nvim",
			"jose-elias-alvarez/typescript.nvim",
			"j-hui/fidget.nvim", -- nvim-lsp progress
			"folke/lsp-colors.nvim",
			"lvimuser/lsp-inlayhints.nvim",
		},
		config = function()
			require("snilcy.configs.lsp").setup()
		end,
	})

	-- use 'wellle/targets.vim'
end)
