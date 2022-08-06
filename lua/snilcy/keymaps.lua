local map = vim.api.nvim_set_keymap

local silent_opts = {
	noremap = true,
	silent = false,
} -- default

local noisy_opts = {
	noremap = true,
	silent = false,
} -- with logs

-- local expr_opts = {
-- 	noremap = true,
-- 	expr = true,
-- 	silent = true,
--  } -- expression

map("i", "<A-j>", "<Esc>", silent_opts)
map("i", "<C-j>", "<Esc>", silent_opts)
map("t", "<C-j>", "<C-\\><C-n>", silent_opts)

map("", "<up>", ":echoe \"Use k\"<CR>", noisy_opts)
map("", "<down>", ":echoe \"Use j\"<CR>", noisy_opts)
map("", "<left>", ":echoe \"Use h\"<CR>", noisy_opts)
map("", "<right>", ":echoe \"Use l\"<CR>", noisy_opts)

-- Paste over currently selected text without yanking it
map("v", "p", "\"_dP", silent_opts)

-- Cancel search highlighting with ESC
map("n", "<ESC>", ":nohlsearch<Bar>:echo<CR>", silent_opts)

-- Move selected line / block of text in visual mode
-- map("x", "K", ":move '<-2<CR>gv-gv", silent_opts)
-- map("x", "J", ":move '>+1<CR>gv-gv", silent_opts)

map("n", "<C-k>", "<C-e>", silent_opts)
map("n", "<C-j>", "<C-y>", silent_opts)

-- map('', '<A-p>s', ':PackerSync<CR>', silent_opts)

-- map('', '<A-c>r',
--   ':source ~/.config/nvim/init.lua<CR>' ..
--   ':source ~/.config/nvim/lua/snilcy/keymaps.lua<CR>' ..
--   ':source ~/.config/nvim/lua/snilcy/plugins.lua<CR>' ..
--   ':source ~/.config/nvim/lua/snilcy/settings.lua<CR>' ..
--   ':source ~/.config/nvim/lua/snilcy/configs/nvim-tree.lua<CR>' ..
--   ':source ~/.config/nvim/lua/snilcy/configs/whichkey.lua<CR>' ..
--   ':echo "Configs have reloaded!"<CR>',
--   noisy_opts
-- )

map("", "<C-q>", "<Esc>:wqall!<CR>", silent_opts)
map("n", "<C-s>", "<Esc>:w!<CR>", silent_opts)
map("i", "<C-s>", "<Esc>:w!<CR>", silent_opts)
map("i", "<C-z>", "u", silent_opts)
map("", "<C-w>", "<Esc>:w!<CR>:bdelete!<CR>", silent_opts)

-- map("", "<A-e>", ":NvimTreeRefresh<CR>:NvimTreeOpen<CR>", silent_opts)

map("", "<A-j>", ":BufferLineCyclePrev<CR>", silent_opts)
map("", "<A-k>", ":BufferLineCycleNext<CR>", silent_opts)
map("", "<A-h>", "<C-^>", silent_opts) -- prevues buffer

-- map('', '<A-b>c', ':BufferLinePickClose<CR>', silent_opts)
-- map('', '<A-b>p', ':BufferLinePick<CR>', silent_opts)
-- map('', '<A-b>r', ':BufferLineCloseRight<CR>', silent_opts)
-- map('', '<A-b>l', ':BufferLineCloseLeft<CR>', silent_opts)
-- map('', '<A-b>o', ':BufferLineCloseRight<CR>:BufferLineCloseLeft<CR>', silent_opts)

map("", "<A-Up>", ":wincmd k<CR>", silent_opts)
map("", "<A-Down>", ":wincmd j<CR>", silent_opts)
map("", "<A-Left>", ":wincmd h<CR>", silent_opts)
map("", "<A-Right>", ":wincmd l<CR>", silent_opts)

map("", "<A-C-Up>", ":resize +2<CR>", silent_opts)
map("", "<A-C-Down>", ":resize -2<CR>", silent_opts)
map("", "<A-C-Left>", ":vertical resize -2<CR>", silent_opts)
map("", "<A-C-Right>", ":vertical resize +2<CR>", silent_opts)

map("n", "K", ":lua vim.lsp.buf.hover()<CR>", silent_opts)
map("n", "[d", ":lua vim.diagnostic.goto_prev()<CR>", silent_opts)
map("n", "]d", ":lua vim.diagnostic.goto_next()<CR>", silent_opts)
map("n", "[e", ":lua vim.diagnostic.goto_prev({severity = vim.diagnostic.severity.ERROR})<CR>", silent_opts)
map("n", "]e", ":lua vim.diagnostic.goto_next({severity = vim.diagnostic.severity.ERROR})<CR>", silent_opts)

map("", "<A-o>", "o<Esc>", silent_opts)
map("", "<A-O>", "O<Esc>", silent_opts)
