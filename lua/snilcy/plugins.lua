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
    prompt_border = "rounded",
    open_fn = function()
      return require("packer.util").float({
        border = "rounded",
      })
    end,
  },
})

packer.startup(function(use)
  -- utils
  use({
    { "lewis6991/impatient.nvim" },
    { "kyazdani42/nvim-web-devicons" },
    { "nvim-lua/plenary.nvim", module = "plenary" },
    { "rcarriga/nvim-notify" },
    { "nvim-lua/popup.nvim" },
    { "MunifTanjim/nui.nvim" },
    { "stevearc/dressing.nvim" },
    { "junegunn/fzf", run = "./install --all" },
    { "ibhagwan/fzf-lua" },
  })

  -- treesitter
  use({
    "nvim-treesitter/nvim-treesitter",
    requires = {
      { "p00f/nvim-ts-rainbow" },
    },
    run = ":TSUpdate",
  })

  -- components
  use({
    { "rebelot/kanagawa.nvim" },
    { "goolord/alpha-nvim" },
    { "Shatur/neovim-session-manager" },
    { "nvim-lualine/lualine.nvim", requires = "SmiteshP/nvim-gps" },
    {
      "akinsho/bufferline.nvim",
      tag = "v2.*",
    },
    { "folke/which-key.nvim" },
    { "nvim-neo-tree/neo-tree.nvim", branch = "v2.x" },
    -- { "ms-jpq/chadtree", branch = "chad", run = "python3 -m chadtree deps" },
    -- { "kyazdani42/nvim-tree.lua", tag = "nightly" },
    -- { "catppuccin/nvim", run = ":CatppuccinCompile" },
  })

  -- buffer
  use({
    -- functional
    { "simrat39/symbols-outline.nvim" },
    {
      "anuvyklack/pretty-fold.nvim",
      requires = {
        "anuvyklack/keymap-amend.nvim",
        "anuvyklack/fold-preview.nvim",
      },
    },
    { "windwp/nvim-ts-autotag" },
    { "windwp/nvim-spectre" }, -- replacer
    { "folke/todo-comments.nvim" },
    { "folke/trouble.nvim" },
    { "numToStr/Comment.nvim" },
    { "phaazon/hop.nvim" },
    { "ggandor/lightspeed.nvim" },

    -- 	-- visual
    { "lukas-reineke/indent-blankline.nvim" },
    { "norcalli/nvim-colorizer.lua" },
    { "petertriho/nvim-scrollbar", module = "scrollbar" },
  })

  -- -- git
  use({
    { "kdheepak/lazygit.nvim" },
    { "tanvirtin/vgit.nvim" },
    { "tpope/vim-fugitive" },
    { "idanarye/vim-merginal" },
    { "rbong/vim-flog" },
    { "TimUntersberger/neogit" },
    { "sindrets/diffview.nvim" },
    {
      "akinsho/git-conflict.nvim",
      tag = "*",
      config = function()
        require("git-conflict").setup()
      end,
    },
  })

  -- -- telescope
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

  -- -- cmp
  use({
    "hrsh7th/nvim-cmp",
    requires = {
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-nvim-lua",
      -- "ray-x/cmp-treesitter",
      "L3MON4D3/LuaSnip",
      "rafamadriz/friendly-snippets",
      "saadparwaiz1/cmp_luasnip",
      "onsails/lspkind.nvim",
      "windwp/nvim-autopairs",
    },
  })

  -- -- lsp
  use({
    "neovim/nvim-lspconfig",
    config = function()
      require("snilcy.configs.lsp").setup()
    end,
    requires = {
      "folke/neodev.nvim",
      -- "folke/lua-dev.nvim",
      "lvimuser/lsp-inlayhints.nvim",
      -- "ray-x/lsp_signature.nvim",
      -- "williamboman/nvim-lsp-installer",
      -- "RRethy/vim-illuminate",
      "ThePrimeagen/refactoring.nvim",
      "jose-elias-alvarez/null-ls.nvim",
      "j-hui/fidget.nvim",
      "b0o/schemastore.nvim", -- nvim-lsp progress
      "jose-elias-alvarez/typescript.nvim",
      "folke/lsp-colors.nvim",

      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "WhoIsSethDaniel/mason-tool-installer.nvim",
    },
  })

  use({ "segeljakt/vim-silicon" })
  use({ "ziontee113/syntax-tree-surfer" }) -- vU vD vd vu
end)
