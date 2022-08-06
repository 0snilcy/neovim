-- local cmd = vim.cmd -- execute Vim commands
-- local g = vim.g -- global variables
-- local o = vim.o
-- local api = vim.api
-- local fn = vim.fn
-- local opt = vim.opt -- global/buffer/windows-scoped options
-- local exec = vim.api.nvim_exec -- execute Vimscript

-- api.nvim_set_keymap("", "<Space>", "<Nop>", {
-- 	noremap = true,
-- 	silent = true,
-- })

-- g.loaded_perl_provider = 0
-- g.loaded_ruby_provider = 0
-- g.ignorecase = true
-- g.smartcase = true

-- opt.clipboard = "unnamedplus"

-- opt.spelllang = {
-- 	"en_us",
-- 	"ru",
-- } -- Словари рус eng
-- opt.undofile = true -- Возможность отката назад
-- opt.timeoutlen = 500

-- -- -----------------------------------------------------------
-- -- -- Главные
-- -- -----------------------------------------------------------
-- opt.number = true -- Включаем нумерацию строк
-- opt.relativenumber = true -- Вкл. относительную нумерацию строк
-- opt.so = 10 -- Курсор всегда в центре экрана
-- opt.mouse = "a"

-- opt.scrolloff = 10 -- is one of my fav
-- opt.sidescroll = 10
-- opt.sidescrolloff = 10
-- -- opt.swapfile = false
-- opt.cmdheight = 10

-- opt.foldmethod = "expr"
-- opt.foldexpr = "nvim_treesitter#foldexpr()"
-- opt.foldenable = false

-- opt.cursorline = true -- Подсветка строки с курсором
-- opt.signcolumn = "yes"
-- opt.wrap = true
-- -- g.tagbar_compact = 1
-- -- g.tagbar_sort = 0
-- g.wildoptions = "pum,tagfile"
-- g.wildmenu = true

-- cmd "colorscheme onedark"
-- o.background = "dark" -- or "light" for light mode
-- cmd 'colorscheme gruvbox'
-- cmd "colorscheme everforest"
-- cmd [[highlight link LspSagaFinderSelection Search]]

-- -----------------------------------------------------------
-- -- Табы и отступы
-- -----------------------------------------------------------
-- cmd([[
--   filetype indent plugin on
--   syntax enable
-- ]])
-- opt.expandtab = true -- use spaces instead of tabs
-- opt.shiftwidth = 2 -- shift 4 spaces when tab
-- opt.tabstop = 2 -- 1 tab == 4 spaces
-- opt.autoindent = true
-- opt.smartindent = true -- autoindent new lines

-- -- don't auto commenting new lines
-- cmd [[au BufEnter * set fo-=c fo-=r fo-=o]]
-- -- remove line lenght marker for selected filetypes
-- cmd [[autocmd FileType text,markdown,html,xhtml,javascript setlocal cc=0]]
-- -- 2 spaces for selected filetypes
-- cmd [[
-- autocmd FileType xml,html,xhtml,css,scss,javascript,lua,yaml,htmljinja setlocal shiftwidth=2 tabstop=2
-- ]]
-- -- С этой строкой отлично форматирует html файл, который содержит jinja2
-- cmd [[ autocmd BufNewFile,BufRead *.html set filetype=htmldjango ]]

-- -----------------------------------------------------------
-- -- Цветовая схема
-- -----------------------------------------------------------
-- opt.termguicolors = true --  24-bit RGB colors
-- cmd 'colorscheme onedark'

-- local opt = vim.opt -- global/buffer/windows-scoped options

-- -- Направление перевода с русского на английский
-- g.translate_source = 'ru'
-- g.translate_target = 'en'

-- -- Компактный вид у тагбара и Отк. сортировка по имени у тагбара

-- vim.g.colors_name = 'gloombuddy'

-- opt.colorcolumn = '80' -- Разделитель на 80 символов
-- opt.splitright = true -- vertical split вправо
-- opt.splitbelow = true -- horizontal split вниз
-- -----------------------------------------------------------
-- -- Полезные фишки
-- -----------------------------------------------------------
-- -- Запоминает где nvim последний раз редактировал файл
-- cmd([[
-- autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
-- ]])

-- This adds the ":DiffOrig" command.  Use this in a modified buffer to see the
-- differences with the file it was loaded from.  See |diff| and |:DiffOrig|.
-- cmd([[
--   command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
-- 		  \ | wincmd p | diffthis
-- ]])

-- Подсвечивает на доли секунды скопированную часть текста
-- exec([[
-- augroup YankHighlight
-- autocmd!
-- autocmd TextYankPost * silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=200}
-- augroup end
-- ]], false)

-- -----------------------------------------------------------
-- -- Установки для плагинов
-- -----------------------------------------------------------
-- o.completeopt = "noinsert,menuone,noselect"
-- set nocompatible            " disable compatibility to old-time vi
-- set showmatch               " show matching
-- set ignorecase              " case insensitive
-- set mouse=v                 " middle-click paste with
-- set hlsearch                " highlight search
-- set incsearch               " incremental search
-- set tabstop=4               " number of columns occupied by a tab
-- set softtabstop=4           " see multiple spaces as tabstops so <BS> does the right thing
-- set expandtab               " converts tabs to white space
-- set shiftwidth=4            " width for autoindents
-- set autoindent              " indent a new line the same amount as the line just typed
-- set number                  " add line numbers
-- set wildmode=longest,list   " get bash-like tab completions
-- set cc=80                  " set an 80 column border for good coding style
-- filetype plugin indent on   "allow auto-indenting depending on file type
-- syntax on                   " syntax highlighting
-- set mouse=a                 " enable mouse click
-- set clipboard=unnamedplus   " using system clipboard
-- filetype plugin on
-- set cursorline              " highlight current cursorline
-- set ttyfast                 " Speed up scrolling in Vim
-- " set spell                 " enable spell check (may need to download language package)
-- " set noswapfile            " disable creating swap file
-- " set backupdir=~/.cache/vim " Directory to store backup files.

-- g.mapleader = " "
-- g.maplocalleader = " "

-- opt.path:append "**"
-- cmd([[set path=.,,,$PWD/**]]) -- Set the path directly
-- cmd([[set dir=.]]) -- Set the dirs for swapfile

-- opt.wildignorecase = true
-- opt.wildignore:append("**/node_modules/*")
-- opt.wildignore:append("**/.git/*")

-- Better Netrw
-- g.netrw_banner = 0 -- Hide banner
-- g.netrw_browse_split = 4 -- Open in previous window
-- g.netrw_altv = 1 -- Open with right splitting
-- g.netrw_liststyle = 3 -- Tree-style view
-- g.netrw_list_hide = (fn["netrw_gitignore#Hide"]()) .. [[,\(^\|\s\s\)\zs\.\S\+]] -- use .gitignore

-- opt.history = 50

-- opt.backup = false
-- opt.backupext = ".bak"

-- local wins = api.nvim_list_wins()
-- for index, value in ipairs(wins) do
--   api.nvim_win_set_option
-- end

-- api.nvim_create_autocmd({ "WinEnter", "WinNew", "WinLeave", "WinClosed", "" }, {
-- 	callback = function(data)
-- 		print("CALLBACK: " .. data.event)
-- 		-- print(vim.inspect(data))
-- 		-- print(vim.inspect(data))
-- 	end,
-- })
