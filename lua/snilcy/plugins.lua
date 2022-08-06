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

--- startup and add configure plugins
packer.startup(function(use)
	-- Load only when require

	-- All the lua functions I don't want to write twice.
	use({ "nvim-lua/plenary.nvim", module = "plenary" })
	use("nvim-lua/popup.nvim")
	-- use("b0o/schemastore.nvim")

	-- Fast as FUCK nvim completion. SQLite, concurrent scheduler, hundreds of hours of optimization.
	-- use { 'ms-jpq/coq.nvim' }

	-- A completion plugin for neovim coded in Lua.
	use({
		"hrsh7th/nvim-cmp", -- event = "InsertEnter",
		-- opt = true,
		config = function()
			require("snilcy.configs.cmp").setup()
		end, -- wants = { "LuaSnip" },
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
		requires = {
			"folke/lua-dev.nvim",
			"williamboman/nvim-lsp-installer",
			"ray-x/lsp_signature.nvim",
			"RRethy/vim-illuminate", -- automatically highlighting other uses of the word under the cursor
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
	-- Better syntax highlight for all langs
	-- An incremental parsing system for programming tools
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
		config = function()
			require("nvim-treesitter.configs").setup({
				ensure_installed = "all",
				sync_install = false,
				highlight = {
					enable = true,
				},
				indent = {
					enable = true,
				},
			})
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

	-- Better icons
	use({
		"kyazdani42/nvim-web-devicons",
		module = "nvim-web-devicons",
		config = function()
			require("nvim-web-devicons").setup({
				default = true,
			})
		end,
	})

	use({
		"nvim-lualine/lualine.nvim",
		event = "VimEnter",
		config = function()
			require("snilcy.configs.lualine").setup()
		end,
		requires = {
			"nvim-web-devicons",
		},
	})

	-- Simple statusline component that shows what scope you are working inside
	use({
		"SmiteshP/nvim-gps",
		requires = "nvim-treesitter/nvim-treesitter",
		module = "nvim-gps",
		config = function()
			require("nvim-gps").setup()
		end,
	})

	use({
		"akinsho/bufferline.nvim",
		requires = "kyazdani42/nvim-web-devicons",
		config = function()
			require("bufferline").setup({
				options = {
					themable = true,
					numbers = "none",
					diagnostics = "nvim_lsp",
					separator_style = "slant",
					show_buffer_close_icons = false,
					show_close_icon = false,
					show_buffer_icons = true,
					show_tab_indicators = true,
					always_show_bufferline = true,
					tab_size = 0,
					offsets = {
						{
							filetype = "NvimTree",
							text = "File Explorer",
							text_align = "center",
						},
					},
				},
			})
		end,
	})

	-- use({
	-- 	"kyazdani42/nvim-tree.lua",
	-- 	requires = "kyazdani42/nvim-web-devicons",
	-- 	-- tag = "nightly",
	-- 	-- config = require("snilcy.configs.nvim-tree"),
	-- })

	use({ "ms-jpq/chadtree", branch = "chad", run = "python3 -m chadtree deps" })
	-- use 'majutsushi/tagbar'

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
		-- tag = "0.1.0",
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
		-- cmd = {
		-- 	"TroubleToggle",
		-- 	"Trouble",
		--  },
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
		"catppuccin/nvim",
		as = "catppuccin",
		run = ":CatppuccinCompile",
		config = function()
			require("snilcy.configs.catppuccin").setup()
		end,
	})

	use({
		"mfussenegger/nvim-dap",
		module = { "dap" },
		requires = {
			"Pocco81/DAPInstall.nvim",
			"theHamsta/nvim-dap-virtual-text",
			"rcarriga/nvim-dap-ui",
			"nvim-telescope/telescope-dap.nvim",
			-- "mfussenegger/nvim-dap-python",
			-- { "leoluz/nvim-dap-go", module = "dap-go" },
			-- { "jbyuki/one-small-step-for-vimkind", module = "osv" },
		},
		config = function()
			require("snilcy.configs.dap").setup()
		end,
	})
	use({
		"mxsdev/nvim-dap-vscode-js",
		requires = {
			"mfussenegger/nvim-dap",
			-- {
			-- 	"microsoft/vscode-js-debug",
			-- 	opt = true,
			-- 	run = "npm install --legacy-peer-deps && npm run compile",
			-- },
		},
	})

	use({ "stevearc/dressing.nvim" })
	-- 	config = function()
	-- 		require("snilcy.configs.vimspector").setup()
	-- 	end,
	-- })
end)
