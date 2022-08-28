local cmd = vim.cmd -- execute Vim commands
local g = vim.g -- global variables
local o = vim.o
local api = vim.api
local fn = vim.fn
local opt = vim.opt

g.loaded_perl_provider = 0
g.loaded_ruby_provider = 0
g.ignorecase = true
g.smartcase = true

-- opt.clipboard = "unnamedplus"

vim.g.clipboard = {
	name = "win32yank-wsl",
	copy = {
		["+"] = "win32yank.exe -i --crlf",
		["*"] = "win32yank.exe -i --crlf",
	},
	paste = {
		["+"] = "win32yank.exe -o --crlf",
		["*"] = "win32yank.exe -o --crlf",
	},
	-- cache_enable = 0,
}

opt.spelllang = {
	"en_us",
	"ru",
} -- Словари рус eng
opt.undofile = true -- Возможность отката назад
opt.timeoutlen = 500

-- -----------------------------------------------------------
-- -- Главные
-- -----------------------------------------------------------
opt.number = true -- Включаем нумерацию строк
opt.relativenumber = true -- Вкл. относительную нумерацию строк
opt.so = 10 -- Курсор всегда в центре экрана
opt.mouse = "a"

opt.scrolloff = 10 -- is one of my fav
opt.sidescroll = 10
opt.sidescrolloff = 10
-- opt.swapfile = false
opt.cmdheight = 1

opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()"
opt.foldenable = false

opt.cursorline = true -- Подсветка строки с курсором
opt.signcolumn = "yes"
opt.wrap = true
-- g.tagbar_compact = 1
-- g.tagbar_sort = 0
g.wildoptions = "pum,tagfile"
g.wildmenu = true

-- cmd "colorscheme onedark"
-- o.background = "dark" -- or "light" for light mode
-- cmd 'colorscheme gruvbox'
-- cmd "colorscheme everforest"
-- g.catppuccin_flavour = "frappe" -- latte, frappe, macchiato, mocha
-- cmd([[colorscheme catppuccin]])
-- cmd [[highlight link LspSagaFinderSelection Search]]

-- -----------------------------------------------------------
-- -- Табы и отступы
-- -----------------------------------------------------------
cmd([[
  filetype indent plugin on
  syntax enable
]])
opt.expandtab = true -- use spaces instead of tabs
opt.shiftwidth = 2 -- shift 4 spaces when tab
opt.tabstop = 2 -- 1 tab == 4 spaces
opt.autoindent = true
opt.smartindent = true -- autoindent new lines

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
opt.termguicolors = true --  24-bit RGB colors
-- cmd 'colorscheme onedark'

local exec = vim.api.nvim_exec -- execute Vimscript
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
cmd([[
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
]])

-- This adds the ":DiffOrig" command.  Use this in a modified buffer to see the
-- differences with the file it was loaded from.  See |diff| and |:DiffOrig|.
cmd([[
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
		  \ | wincmd p | diffthis
]])

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
o.completeopt = "noinsert,menuone,noselect"

api.nvim_set_keymap("", "<Space>", "<Nop>", {
	noremap = true,
	silent = true,
})

g.mapleader = " "
g.maplocalleader = " "

-- opt.path:append "**"
cmd([[set path=.,,,$PWD/**]]) -- Set the path directly
-- cmd([[set dir=.]]) -- Set the dirs for swapfile

opt.wildignorecase = true
opt.wildignore:append("**/node_modules/*")
opt.wildignore:append("**/.git/*")

-- Better Netrw
g.netrw_banner = 0 -- Hide banner
g.netrw_browse_split = 4 -- Open in previous window
g.netrw_altv = 1 -- Open with right splitting
g.netrw_liststyle = 3 -- Tree-style view
g.netrw_list_hide = (fn["netrw_gitignore#Hide"]()) .. [[,\(^\|\s\s\)\zs\.\S\+]] -- use .gitignore

opt.history = 100

opt.backup = false
opt.backupext = ".bak"

-- cmd('set shada=!,'100,"300,<0,s10')
cmd("set shada=" .. table.concat({
	-- Save and restore global variables that start
	-- with an uppercase letter, and don't contain a lowercase
	-- letter.
	"!",

	-- Maximum number of previously edited files for which the marks
	-- are remembered.
	"'100",

	-- Maximum number of lines saved for each register.
	"\"300",

	-- Maximum number of lines saved for each register.  If zero then
	--	registers are not saved.
	"<0",

	-- Maximum size of an item contents in KiB.  If zero then nothing
	-- is saved.
	"s10",
}, ","))

vim.opt.cursorline = true
vim.opt.termguicolors = true
vim.opt.winblend = 0
vim.opt.wildoptions = "pum"
vim.opt.pumblend = 5
vim.opt.background = "dark"
vim.opt.showcmd = true
