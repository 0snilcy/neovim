local mixed_key = "__mixed__"

local map = {
	[mixed_key] = {
		{ "<Space>", "<Nop>" },

		{ "<C-s>", "<Esc>:w!<CR>", { "n", "i" } },
		{ "<A-s>", "<Esc>:w!<CR>", { "n", "i" } },

		{ "<C-q>", "<Esc>:wall!<CR>:SessionManager save_current_session<CR>:%bdelete!<CR>:qall!<CR>" },
		{ "<C-w>", "<Esc>:bdelete!<CR>" },
		-- { "<A-q>", ":TroubleClose<CR>:NvimTreeClose<CR>" },

		{ "<A-Up>", ":wincmd k<CR>" },
		{ "<A-Down>", ":wincmd j<CR>" },
		{ "<A-Left>", ":wincmd h<CR>" },
		{ "<A-Right>", ":wincmd l<CR>" },

		{ "<A-C-Up>", ":resize +2<CR>" },
		{ "<A-C-Down>", ":resize -2<CR>" },
		{ "<A-C-Left>", ":vertical resize -2<CR>" },
		{ "<A-C-Right>", ":vertical resize +2<CR>" },

		{ "<A-o>", "o<Esc>" },
		{ "<A-O>", "O<Esc>" },
	},

	-- normal
	n = {
		{ "<A-j>", ":BufferLineCyclePrev<CR>" },
		{ "<A-k>", ":BufferLineCycleNext<CR>" },
		{ "<S-A-j>", ":tabnext<CR>" },
		{ "<S-A-k>", ":tabprev<CR>" },
		{ "<ESC>", ":nohlsearch<Bar>:echo<CR>" }, -- Cancel search highlighting with ESC
		{ "<C-j>", "<C-e>" },
		{ "<C-k>", "<C-y>" },
		{ "K", ":lua vim.lsp.buf.hover()<CR>" },
		-- { "p", '"+p' },
	},

	-- insert
	i = {
		{ "<A-j>", "<Esc>" },
	},

	-- visual
	v = {
		{ "p", '"_dP' }, -- Paste over currently selected text without yanking it
		-- { "y", '"+y' },
		-- { "d", '"+d' },
	},

	-- terminal
	t = {
		{ "<A-j>", "<C-\\><C-n>" },
	},

	-- map("", "<C-c>", "\"+")

	-- Move selected line / block of text in visual mode
	-- map("x", "K", ":move '<-2<CR>gv-gv", silent_opts)
	-- map("x", "J", ":move '>+1<CR>gv-gv", silent_opts)
	-- { "<C-q>", "<Esc>:q!<CR>" },
	-- { "<C-z>", "u", "i" },
	-- map("", "<A-h>", "<C-^>", silent_opts) -- prevues buffer

	-- { "[d", ":lua vim.diagnostic.goto_prev()<CR>", "n" },
	-- { "]d", ":lua vim.diagnostic.goto_next()<CR>", "n" },
	-- { "[e", ":lua vim.diagnostic.goto_prev({severity = vim.diagnostic.severity.ERROR})<CR>", "n" },
	-- { "]e", ":lua vim.diagnostic.goto_next({severity = vim.diagnostic.severity.ERROR})<CR>", "n" },

	-- map("", "<up>", ":echoe \"Use k\"<CR>", noisy_opts)
	-- map("", "<down>", ":echoe \"Use j\"<CR>", noisy_opts)
	-- map("", "<left>", ":echoe \"Use h\"<CR>", noisy_opts)
	-- map("", "<right>", ":echoe \"Use l\"<CR>", noisy_opts)
	-- { "<C-j>", "<Esc>", "i" },
}

-- local expr_opts = {
-- 	noremap = true,
-- 	expr = true,
-- 	silent = true,
--  } -- expression

local default_opts = {
	noremap = true,
	silent = false,
}

for map_group_key, map_group_value in pairs(map) do
	local is_mixed = map_group_key == mixed_key

	for _, map_item in pairs(map_group_value) do
		local lhs = map_item[1]
		local rhs = map_item[2]
		local mode = is_mixed and (map_item[3] or "") or map_group_key
		local opts = map_item[4] or default_opts

		vim.keymap.set(mode, lhs, rhs, opts)
	end
end

-- notation	meaning		    equivalent	decimal value(s)
-- <Nul>		zero			CTRL-@	  0 (stored as 10) *<Nul>*
-- <BS>		backspace		CTRL-H	  8	*backspace*
-- <Tab>		tab			CTRL-I	  9	*tab* *Tab*
-- 							*linefeed*
-- <NL>		linefeed		CTRL-J	 10 (used for <Nul>)
-- <CR>		carriage return		CTRL-M	 13	*carriage-return*
-- <Return>	same as <CR>				*<Return>*
-- <Enter>		same as <CR>				*<Enter>*
-- <Esc>		escape			CTRL-[	 27	*escape* *<Esc>*
-- <Space>		space				 32	*space*
-- <lt>		less-than		<	 60	*<lt>*
-- <Bslash>	backslash		\	 92	*backslash* *<Bslash>*
-- <Bar>		vertical bar		|	124	*<Bar>*
-- <Del>		delete				127
-- <CSI>		command sequence intro  ALT-Esc 155	*<CSI>*
-- <EOL>		end-of-line (can be <CR>, <NL> or <CR><NL>,
-- 		depends on system and 'fileformat')	*<EOL>*
-- <Ignore>	cancel wait-for-character		*<Ignore>*
-- <NOP>		no-op: do nothing (useful in mappings)	*<Nop>*
-- <Up>		cursor-up			*cursor-up* *cursor_up*
-- <Down>		cursor-down			*cursor-down* *cursor_down*
-- <Left>		cursor-left			*cursor-left* *cursor_left*
-- <Right>		cursor-right			*cursor-right* *cursor_right*
-- <S-Up>		shift-cursor-up
-- <S-Down>	shift-cursor-down
-- <S-Left>	shift-cursor-left
-- <S-Right>	shift-cursor-right
-- <C-Left>	control-cursor-left
-- <C-Right>	control-cursor-right
-- <F1> - <F12>	function keys 1 to 12		*function_key* *function-key*
-- <S-F1> - <S-F12> shift-function keys 1 to 12	*<S-F1>*
-- <Help>		help key
-- <Undo>		undo key
-- <Insert>	insert key
-- <Home>		home				*home*
-- <End>		end				*end*
-- <PageUp>	page-up				*page_up* *page-up*
-- <PageDown>	page-down			*page_down* *page-down*
-- <kUp>		keypad cursor-up		*keypad-cursor-up*
-- <kDown>		keypad cursor-down		*keypad-cursor-down*
-- <kLeft>		keypad cursor-left		*keypad-cursor-left*
-- <kRight>	keypad cursor-right		*keypad-cursor-right*
-- <kHome>		keypad home (upper left)	*keypad-home*
-- <kEnd>		keypad end (lower left)		*keypad-end*
-- <kOrigin>	keypad origin (middle)		*keypad-origin*
-- <kPageUp>	keypad page-up (upper right)	*keypad-page-up*
-- <kPageDown>	keypad page-down (lower right)	*keypad-page-down*
-- <kDel>		keypad delete 			*keypad-delete*
-- <kPlus>		keypad +			*keypad-plus*
-- <kMinus>	keypad -			*keypad-minus*
-- <kMultiply>	keypad *			*keypad-multiply*
-- <kDivide>	keypad /			*keypad-divide*
-- <kPoint>	keypad .			*keypad-point*
-- <kComma>	keypad ,			*keypad-comma*
-- <kEqual>	keypad =			*keypad-equal*
-- <kEnter>	keypad Enter			*keypad-enter*
-- <k0> - <k9>	keypad 0 to 9			*keypad-0* *keypad-9*
-- <S-…>		shift-key			*shift* *<S-*
-- <C-…>		control-key			*control* *ctrl* *<C-*
-- <M-…>		alt-key or meta-key		*META* *ALT* *<M-*
-- <A-…>		same as <M-…>			*<A-*
-- <D-…>		command-key or "super" key	*<D-*

-- 							*map-table*
--          Mode  | Norm | Ins | Cmd | Vis | Sel | Opr | Term | Lang |
-- Command        +------+-----+-----+-----+-----+-----+------+------+
-- [nore]map      | yes  |  -  |  -  | yes | yes | yes |  -   |  -   |
-- n[nore]map     | yes  |  -  |  -  |  -  |  -  |  -  |  -   |  -   |
-- [nore]map!     |  -   | yes | yes |  -  |  -  |  -  |  -   |  -   |
-- i[nore]map     |  -   | yes |  -  |  -  |  -  |  -  |  -   |  -   |
-- c[nore]map     |  -   |  -  | yes |  -  |  -  |  -  |  -   |  -   |
-- v[nore]map     |  -   |  -  |  -  | yes | yes |  -  |  -   |  -   |
-- x[nore]map     |  -   |  -  |  -  | yes |  -  |  -  |  -   |  -   |
-- s[nore]map     |  -   |  -  |  -  |  -  | yes |  -  |  -   |  -   |
-- o[nore]map     |  -   |  -  |  -  |  -  |  -  | yes |  -   |  -   |
-- t[nore]map     |  -   |  -  |  -  |  -  |  -  |  -  | yes  |  -   |
-- l[nore]map     |  -   | yes | yes |  -  |  -  |  -  |  -   | yes  |
