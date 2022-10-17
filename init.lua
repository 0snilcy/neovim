-- To disable Nvim's default filetype detection and revert to Vim's legacy filetype detection
-- vim.g.do_legacy_filetype = 0

-- vim.g.do_filetype_lua = 1

-- The builtin filetype detection provided by Nvim can be disabled by setting the did_load_filetypes global variable. If this variable exists, neither the default $VIMRUNTIME/filetype.lua nor the legacy $VIMRUNTIME/filetype.vim will run.
-- vim.g.did_load_filetypes = 0

-- Do not source the default filetype.vim
-- vim.g.did_load_filetypes = 1

require("utils")

require("init")
require("snilcy.settings")
require("snilcy.plugins")

require("utils.api")
