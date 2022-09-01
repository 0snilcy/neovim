-- local map = vim.api.nvim_set_keymap
local map = vim.keymap.set

local opts = {
	noremap = true,
	silent = false,
} -- default

-- local expr_opts = {
-- 	noremap = true,
-- 	expr = true,
-- 	silent = true,
--  } -- expression

map("", "<Space>", "<Nop>", opts)

map("i", "<A-j>", "<Esc>", opts)
map("i", "<C-j>", "<Esc>", opts)
map("t", "<C-j>", "<C-\\><C-n>", opts)

-- map("", "<up>", ":echoe \"Use k\"<CR>", noisy_opts)
-- map("", "<down>", ":echoe \"Use j\"<CR>", noisy_opts)
-- map("", "<left>", ":echoe \"Use h\"<CR>", noisy_opts)
-- map("", "<right>", ":echoe \"Use l\"<CR>", noisy_opts)

-- Paste over currently selected text without yanking it
map("v", "p", "\"_dP", opts)
map("v", "y", "\"+y", opts)

-- Cancel search highlighting with ESC
map("n", "<ESC>", ":nohlsearch<Bar>:echo<CR>", opts)

-- Move selected line / block of text in visual mode
-- map("x", "K", ":move '<-2<CR>gv-gv", silent_opts)
-- map("x", "J", ":move '>+1<CR>gv-gv", silent_opts)

map("n", "<C-j>", "<C-e>", opts)
map("n", "<C-k>", "<C-y>", opts)

map("", "<C-q>", "<Esc>:wqall!<CR>", opts)
map({ "n", "i" }, "<C-s>", "<Esc>:w!<CR>", opts)
map("i", "<C-z>", "u", opts)
map("", "<C-w>", "<Esc>:bdelete!<CR>", opts)

map("", "<A-j>", ":bprev<CR>", opts)
map("", "<A-k>", ":bnext<CR>", opts)
-- map("", "<A-h>", "<C-^>", silent_opts) -- prevues buffer

map("", "<A-Up>", ":wincmd k<CR>", opts)
map("", "<A-Down>", ":wincmd j<CR>", opts)
map("", "<A-Left>", ":wincmd h<CR>", opts)
map("", "<A-Right>", ":wincmd l<CR>", opts)

map("", "<A-C-Up>", ":resize +2<CR>", opts)
map("", "<A-C-Down>", ":resize -2<CR>", opts)
map("", "<A-C-Left>", ":vertical resize -2<CR>", opts)
map("", "<A-C-Right>", ":vertical resize +2<CR>", opts)

map("n", "K", ":lua vim.lsp.buf.hover()<CR>", opts)
map("n", "[d", ":lua vim.diagnostic.goto_prev()<CR>", opts)
map("n", "]d", ":lua vim.diagnostic.goto_next()<CR>", opts)
map("n", "[e", ":lua vim.diagnostic.goto_prev({severity = vim.diagnostic.severity.ERROR})<CR>", opts)
map("n", "]e", ":lua vim.diagnostic.goto_next({severity = vim.diagnostic.severity.ERROR})<CR>", opts)

map("", "<A-o>", "o<Esc>", opts)
map("", "<A-O>", "O<Esc>", opts)

-- map("", "<C-c>", "\"+")
