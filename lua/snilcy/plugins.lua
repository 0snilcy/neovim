local vim = vim
local execute = vim.api.nvim_command
local fn = vim.fn
-- ensure that packer is installed
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
	use({ "lewis6991/impatient.nvim" }) -- Performance

	use({ "kyazdani42/nvim-web-devicons" })
	use({ "nvim-lua/plenary.nvim", module = "plenary" })

	use({ "rcarriga/nvim-notify" })
	use({ "nvim-lua/popup.nvim" })

	use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })

	use({ "petertriho/nvim-scrollbar", module = "scrollbar" })
	use({ "nvim-lualine/lualine.nvim" })

	-- use({ "catppuccin/nvim", run = ":CatppuccinCompile" })
	use({ "rebelot/kanagawa.nvim" })
	-- use({
	-- 	"rose-pine/neovim",
	-- 	as = "rose-pine",
	-- 	tag = "v1.*",
	-- })
	--
	-- use({
	-- 	"olimorris/onedarkpro.nvim",
	-- 	config = function()
	-- 		require("onedarkpro").setup({
	-- 			dark_theme = "onedark", -- The default dark theme
	-- 			light_theme = "onelight", -- The default light theme
	-- 		})
	-- 	end,
	-- })

	-- IndentLine
	use({
		"lukas-reineke/indent-blankline.nvim",
		event = "BufReadPre",
		config = function()
			require("snilcy.configs.indentblankline").setup()
		end,
	})

	-- use("b0o/schemastore.nvim")

	-- Fast as FUCK nvim completion. SQLite, concurrent scheduler, hundreds of hours of optimization.
	-- use { 'ms-jpq/coq.nvim' }

	-- A completion plugin for neovim coded in Lua.
	use({
		"hrsh7th/nvim-cmp",
		-- event = "InsertEnter",
		-- opt = true,
		config = function()
			require("snilcy.configs.cmp").setup()
		end,
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

			-- "hrsh7th/cmp-calc",
			-- "hrsh7th/cmp-nvim-lsp-signature-help",
			-- "ray-x/lsp_signature.nvim",
			-- "f3fora/cmp-spell",
			-- "hrsh7th/cmp-emoji",
			-- {
			--   wants = "friendly-snippets",
			--   config = function()
			--     require("snilcy.configs.luasnip").setup()
			--   end,
			-- },
			-- "rafamadriz/friendly-snippets",
		},
	})

	-- Collection of configurations for built-in LSP client
	-- LSP
	use({
		"neovim/nvim-lspconfig",
		event = "BufReadPre",
		requires = {
			"folke/lua-dev.nvim",
			"williamboman/nvim-lsp-installer",
			"ray-x/lsp_signature.nvim",
			"RRethy/vim-illuminate", -- automatically highlighting other uses of the word under the cursor
			"ThePrimeagen/refactoring.nvim",
			"jose-elias-alvarez/null-ls.nvim",
			"b0o/schemastore.nvim",
			{
				"j-hui/fidget.nvim", -- nvim-lsp progress
				config = function()
					require("fidget").setup({
						text = {
							spinner = "moon",
						},
					})
				end,
			},
			"jose-elias-alvarez/typescript.nvim",
		},
		config = function()
			require("snilcy.configs.lsp").setup()
		end,
	})

	-- use 'joshdick/onedark.vim'
	-- use "ellisonleao/gruvbox.nvim"
	-- use "sainnhe/everforest"

	-- use {
	-- 	"projekt0n/github-nvim-theme",
	-- 	config = function()
	-- 		require"github-theme".setup {
	-- 			theme_style = "dark",
	-- 			comment_style = "NONE",
	-- 			keyword_style = "NONE",
	-- 			function_style = "NONE",
	-- 			variable_style = "NONE",
	-- 		 }
	-- 	end,
	-- }

	-- Simple statusline component that shows what scope you are working inside
	use({
		"SmiteshP/nvim-gps",
		requires = "nvim-treesitter/nvim-treesitter",
		module = "nvim-gps",
		config = function()
			require("nvim-gps").setup()
		end,
	})

	-- use({
	-- 	"kyazdani42/nvim-tree.lua",
	-- 	requires = "kyazdani42/nvim-web-devicons",
	-- 	-- tag = "nightly",
	-- 	-- config = require("snilcy.configs.nvim-tree"),
	-- })

	use({
		"ms-jpq/chadtree",
		branch = "chad",
		run = "python3 -m chadtree deps",
		config = function()
			require("snilcy.configs.chadtree").setup()
		end,
	})

	-- -- use 'majutsushi/tagbar'

	-- use 'sheerun/vim-polyglot'
	-- -- these are optional themes but I hear good things about gloombuddy ;)
	-- -- colorbuddy allows us to run the gloombuddy theme
	-- use 'tjdevries/colorbuddy.nvim'
	-- use 'bkegley/gloombuddy'

	-- -- sneaking some formatting in here too
	-- use {
	--   'prettier/vim-prettier',
	--   run = 'yarn install'
	-- } -- use 'neovim/nvim-lspconfig'

	-- WhichKey
	use({
		"folke/which-key.nvim",
		event = "VimEnter",
		config = function()
			require("snilcy.configs.whichkey").setup()
		end,
	})

	-- use {
	--   'mrjones2014/legendary.nvim',
	--   keys = { [[<C-p>]] },
	--   config = function()
	--     require("snilcy.configs.legendary").setup()
	--   end,
	--   requires = { "stevearc/dressing.nvim" },
	-- }

	-- Easy hopping
	use({
		"phaazon/hop.nvim", -- cmd = { "HopWord", "HopChar1" },
		config = function()
			require("hop").setup({})
		end,
	})

	-- Easy motion
	use({
		"ggandor/lightspeed.nvim",
		keys = {
			"s",
			"S",
			"f",
			"F",
			"t",
			"T",
		},
		config = function()
			require("lightspeed").setup({})
		end,
	})

	-- Markdown
	-- use {
	--   "iamcco/markdown-preview.nvim",
	--   run = function()
	--     vim.fn["mkdp#util#install"]()
	--   end,
	--   ft = "markdown",
	--   cmd = { "MarkdownPreview" },
	-- }

	-- FZF
	use({
		"junegunn/fzf",
		run = "./install --all",
		event = "VimEnter",
	}) -- You don't need to install this if you already have fzf installed
	use({
		"ibhagwan/fzf-lua",
		event = "BufEnter",
		requires = {
			"kyazdani42/nvim-web-devicons",
		},
	})

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

	-- Auto pairs
	use({
		"windwp/nvim-autopairs",
		module = { "nvim-autopairs.completion.cmp", "nvim-autopairs" },
		config = function()
			require("nvim-autopairs").setup({
				check_ts = true,
			})
		end,
	})

	-- Auto tag
	use({
		"windwp/nvim-ts-autotag",
		wants = "nvim-treesitter",
		event = "InsertEnter",
		config = function()
			require("nvim-ts-autotag").setup({
				enable = true,
			})
		end,
	})

	-- Better Comment
	use({
		"numToStr/Comment.nvim", -- opt = true,
		-- keys = { "gc", "gcc", "gbc" },
		config = function()
			require("snilcy.configs.comment").setup()
		end,
	})

	use({
		"nvim-telescope/telescope.nvim",
		opt = true,
		cmd = { "Telescope" },
		module = { "telescope", "telescope.builtin" },
		keys = { "<leader>b", "<leader>p", "<leader>w" },
		wants = {
			"telescope-project.nvim",
			"telescope-file-browser.nvim",
			"telescope-repo.nvim",
			"telescope-fzf-native.nvim",
			"project.nvim",
		},
		requires = {
			"nvim-telescope/telescope-project.nvim",
			"nvim-telescope/telescope-file-browser.nvim",
			"cljoly/telescope-repo.nvim",
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				run = "make",
			},
			{
				"ahmedkhalf/project.nvim",
				config = function()
					require("project_nvim").setup({})
				end,
			},
		},
		config = function()
			require("snilcy.configs.telescope").setup()
		end,
	})

	-- -- trouble.nvim
	use({
		"folke/trouble.nvim",
		event = "BufReadPre",
		wants = "nvim-web-devicons",
		cmd = {
			"TroubleToggle",
			"Trouble",
		},
		config = function()
			require("trouble").setup({
				padding = false,
				use_diagnostic_signs = false,
				height = 20,
				-- auto_open = true,
				auto_close = true,
				auto_preview = true,
			})
		end,
	})

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

	use({
		"norcalli/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup()
		end,
	})

	use({
		"stevearc/dressing.nvim",
		config = function()
			require("dressing").setup({
				select = {
					backend = { "telescope", "fzf", "builtin" },
				},
			})
		end,
	})

	use({ "nathom/filetype.nvim" })

	-- use({
	-- 	"mhinz/vim-startify",
	-- 	config = function()
	-- 		require("snilcy.configs.startify")
	-- 	end,
	-- })

	use({
		"goolord/alpha-nvim",
		requires = { "kyazdani42/nvim-web-devicons" },
		config = function()
			require("snilcy.configs.alpha").setup()
		end,
	})

	use({
		"Shatur/neovim-session-manager",
		wants = {
			"stevearc/dressing.nvim",
		},
		config = function()
			require("session_manager").setup({
				autoload_mode = require("session_manager.config").AutoloadMode.Disabled,
			})
		end,
	})
end)
