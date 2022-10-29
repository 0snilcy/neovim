local status, whichkey = pcall(require, "which-key")
if not status then
  return
end

local packer_reload = function()
  local cwd = vim.fn.getcwd()
  local plugins_path = cwd .. "/lua/snilcy/plugins.lua"

  local output = vim.api.nvim_cmd({
    "source",
    plugins_path,
  }, true)
  require("packer").compile(output)
end

local conf = {
  -- hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ ", "^I" }, -- hide mapping boilerplate
  window = {
    border = "rounded",
    -- border = "single", -- none, single, double, shadow
    -- position = "bottom", -- bottom, top
    margin = { 5, 5, 5, 5 },
  },
  plugins = {
    presets = {
      operators = true, -- adds help for operators like d, y, ... and registers them for motion / text object completion
      motions = true, -- adds help for motions
      text_objects = true, -- help for text objects triggered after entering an operator
      windows = true, -- default bindings on <c-w>
      nav = true, -- misc bindings to work with windows
      z = true, -- bindings for folds, spelling and others prefixed with z
      g = true, -- bindings for prefixed with g
    },
  },
  -- key_labels = {},
}

local opts = {
  mode = "n", -- Normal mode
  prefix = "<leader>",
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = false, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = true, -- use `nowait` when creating keymaps
}

local mappings = {
  s = {
    name = "System",
    c = { ":PackerCompile<CR>", "Compile" },
    i = { ":PackerInstall<CR>", "Install" },
    s = { ":PackerSync<CR>", "Sync" },
    t = { ":PackerStatus<CR>", "Status" },
    u = { ":PackerUpdate<CR>", "Update" },
    d = { ":NullLsInfo<CR>", "Diagnostics Servers" },
    l = { ":LspInfo<CR>", "LSP Servers" },
  },

  b = {
    name = "Buffer",
    w = { ":%bd|e#|bd#<CR>", "Delete all buffers" },
    -- o = { ":BufferLineCloseRight<CR>:BufferLineCloseLeft<CR>", "Close Others" },
    o = { ":SymbolsOutline<CR>", ":Outline<CR>" },
    d = { ":Trouble document_diagnostics<CR>", "Diagnostics" },
    f = { ":lua vim.lsp.buf.formatting()<CR>", "Format" },
    s = { ":Telescope lsp_document_symbols<CR>", "Symbols" },
    g = { ":Telescope current_buffer_fuzzy_find<CR>", "Grep" },
    a = { ":'<,'>lua vim.lsp.buf.range_code_action()<CR>", "Range code actions" },
    r = { ":lua require('spectre').open_file_search()<CR>", "Replace" },
    e = { ":source!<CR>", "Execute" },
  },

  g = {
    name = "Global",
    p = { ":Telescope projects<CR>", "Projects" },
    r = { ":Telescope oldfiles initial_mode=normal<CR>", "Resent files" },
    R = { ":lua require('spectre').open()<CR>", "Replace" },
    l = { ":SessionManager load_session<CR>", "Load Session" },
    L = { ":SessionManager load_last_session<CR>", "Last Sessions" },
    s = { ":SessionManager save_current_session<CR>", "Save Sessions" },
    t = { ":terminal<CR>", "Terminal" },
    c = { packer_reload, "PackerReload" },
  },

  p = {
    name = "Project",
    b = { ":lua require('utils.finder').find_buffers()<CR>", "Buffers grep" },
    f = { ":lua require('utils.finder').find_files()<CR>", "File search" },
    F = { ":Telescope file_browser<CR>", "File browser" },
    A = { ":Neotree toggle source=filesystem reveal=true position=right<CR>", "Sidebar toggle" },
    a = { ":Neotree toggle source=filesystem position=right<CR>", "Sidebar focus toggle" },
    g = { ":Telescope live_grep<CR>", "Grep" },
    s = { ":Telescope lsp_dynamic_workspace_symbols<CR>", "Symbols" },
    T = { ":Trouble workspace_diagnostics<CR>", "Diagnostics" },
    d = { ":TodoTrouble<CR>", "TODO" },
    r = { ":lua require('spectre').open()<CR>", "Replace" },
    t = { ":terminal<CR>", "Terminal" },
    G = { ":LazyGit<CR>", "Git" },
  },

  h = {
    name = "Hop",
    c = { ":HopChar1", "Char" },
    w = { ":HopWor", "War" },
  },

  w = {
    name = "Word",
    i = { ":lua vim.lsp.buf.implementation()<CR>", "Goto Implementation (1) Idea" },
    D = { ":lua vim.lsp.buf.declaration()<CR>", "Declaration (2) Types" },
    d = { ":lua vim.lsp.buf.definition()<CR>", "Definition (3) Value" },
    T = { ":lua vim.lsp.buf.type_definition()<CR>", "Goto Type Definition" },
    e = { ":lua vim.lsp.buf.rename()<CR>", "Rename" },
    r = { ":lua require('utils.finder').replace_buffer_word()<CR>", "Replace in file" },
    R = { ":lua require('spectre').open_visual({select_word=true})<CR>", "Replace global" },
    l = { ":Telescope lsp_references initial_mode=normal<CR>", "References LSP" },
    g = { ":Telescope grep_string<CR>", "Grep word" },
    s = { ":lua require('utils.finder').find_symbol_under_cursor()<CR>", "Search symbol" },
    a = { ":lua vim.lsp.buf.code_action()<CR>", "Code Action" },
    h = { ":lua vim.lsp.buf.signature_help()<CR>", "Signature Help" },
  },
}

local opts_v = {
  mode = "x",
  prefix = "<leader>",
  buffer = nil,
  silent = false,
  noremap = true,
  nowait = false,
}

local mappings_v = {
  e = {
    ":'<,'>source!<CR>",
    "Execute",
  },
}

whichkey.setup(conf)

whichkey.register(mappings, opts)
whichkey.register(mappings_v, opts_v)
