local g = {

  mapleader = " ",
  maplocalleader = " ",
  loaded_perl_provider = 0,
  loaded_ruby_provider = 0,

  -- netrw_banner = 0, -- Hide banner
  -- netrw_browse_split = 4, -- Open in previous window
  -- netrw_altv = 1, -- Open with right splitting
  -- netrw_liststyle = 3, -- Tree-style view
  -- netrw_list_hide = (fn["netrw_gitignore#Hide"]()) .. [[,\(^\|\s\s\)\zs\.\S\+]], -- use .gitignore

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

  neovide_refresh_rate = 144,
  neovide_transparency = 1,
  neovide_confirm_quit = true,
  eovide_cursor_trail_size = 0,
  -- vim.g.neovide_profiler = true
  -- vim.g.neovide_fullscreen = true
}

for key, val in pairs(g) do
  -- vim.g[key] = val
  -- local prev_value = vim.g[key]
  -- dump(prev_value)
  -- local is_table = type(prev_value) == "table"
  -- vim.api.nvim_set_var(key, is_table and extend(prev_value, val) or val)
  vim.api.nvim_set_var(key, val)
end
