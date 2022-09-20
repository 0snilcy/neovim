local opt = {
	--  winbar = "%f",
	laststatus = 3,
	cmdheight = 1,
	mouse = "a", -- to visually select and copy from vim without line numbers
	lazyredraw = true, -- Don't redraw while executing macros (good performance config)
	ttyfast = true, -- Don't redraw while executing macros (good performance config)
	hlsearch = true, -- keep searched chunks highlighted
	ignorecase = true, -- search case-insensitive
	smartcase = true, -- if on with ignorecase, when a pattern contains an uppercase letter, it is case sensitive, otherwise it is not
	writebackup = false, -- Turn backup off, since most stuff is in SVN, git et.c anyway...
	swapfile = false,
	backup = false,
	showcmd = true, -- show what commands you typing, what you select in visual mode, etc.
	autowrite = true, -- Automatically :write before running commands
	scrolloff = 10, -- how many lines till window border to see when scrolling
	sidescroll = 10,
	sidescrolloff = 10, -- same as above but for columns
	-- shell = "/usr/local/bin/zsh",
	-- inccommand = "nosplit", -- incremental search ( enabled by default )
	updatetime = 300, -- timeout for showing cursorhold events, etc
	-- completeopt = "menu,noinsert,noselect", -- how window for completion will look like
	-- shortmess = vim.o.shortmess .. "s", -- better messages
	hidden = true, -- TextEdit might fail if hidden is not set.
	termguicolors = true,
	encoding = "UTF-8",
	list = true,
	listchars = { -- replace chars
		space = "⋅",
		tab = "  ",
		eol = " ",
		precedes = "→",
		extends = "←",
	},
	fillchars = { -- splits char
		-- stlnc = "-",
		-- vert = "¦",
	},
	-- cmd('set shada=!,'100,"300,<0,s10')
	shada = {
		-- Save and restore global variables that start
		-- with an uppercase letter, and don't contain a lowercase
		-- letter.
		"!",

		-- Maximum number of previously edited files for which the marks
		-- are remembered.
		"'100",

		-- Maximum number of lines saved for each register.
		'"300',

		-- Maximum number of lines saved for each register.  If zero then
		--	registers are not saved.
		"<0",

		-- Maximum size of an item contents in KiB.  If zero then nothing
		-- is saved.
		"s10",
	},
	background = "dark",
	winblend = 0,
	pumblend = 0,
	wildmenu = true,
	wildoptions = "pum,tagfile",
	spelllang = {
		"en_us",
		"ru",
	},
	undofile = true,
	timeoutlen = 500,
	splitright = true,
	splitbelow = true,
	wildignorecase = true,
	wildignore = extend(vim.opt.wildignore:get(), {
		"**/.git/*",
		"**/node_modules/*",
	}),
	path = extend(vim.opt.path:get(), {
		"$PWD/**",
		".",
	}),
	history = 100,
	signcolumn = "yes", -- nothing to the left of line number
	foldnestmax = 10, -- deepest fold is 10 levels
	foldenable = true, -- don't fold by default
	foldmethod = "expr",
	foldexpr = "nvim_treesitter#foldexpr()",
	foldcolumn = "0",
	foldlevel = 99,
	foldlevelstart = 99,
	wrap = true, -- when line is longer than the screen, it continues on the next line
	linebreak = true, -- but do not break words, only 'by words'
	number = true, -- show absolute line number
	numberwidth = 1, -- by default 4, and because of that there is empty space to the right to line numbers except current
	relativenumber = true, -- show relative line number for current line
	-- cursorcolumn = true, -- highlight for current column
	colorcolumn = "", -- "80,120", -- highlight some column length
	cursorline = true, -- Highlight the screen line of the cursor with CursorLine

	expandtab = true, -- use spaces instead of tabs
	shiftwidth = 2, -- shift 4 spaces when tab
	tabstop = 2, -- 1 tab == 4 spaces
	autoindent = true,
	smartindent = true, -- autoindent new lines
	clipboard = "unnamedplus",
}

local g = {
	clipboard = {
		name = "win32yank-wsl",
		copy = {
			["+"] = "win32yank -i --crlf",
			["*"] = "win32yank -i --crlf",
		},
		paste = {
			["+"] = "win32yank -o --lf",
			["*"] = "win32yank -o --lf",
		},
		cache_enable = 0,
	},
}

for key, val in pairs(opt) do
	vim.opt[key] = val
end
for key, val in pairs(g) do
	vim.g[key] = val
end
