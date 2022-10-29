local status, tree = pcall(require, "nvim-tree")
if not status then
  return
end

tree.setup({
  disable_netrw = true,
  hijack_netrw = true,
  reload_on_bufenter = true,
  sync_root_with_cwd = true,
  update_focused_file = {
    enable = true,
  },
  git = {
    enable = true,
    ignore = true,
    show_on_dirs = true,
    timeout = 400,
  },
  view = {
    side = "right",
    width = 40,
    -- hide_root_folder = true,
    number = true,
    relativenumber = true,
  },
  diagnostics = {
    -- enable = true,
    -- show_on_dirs = true,
  },
  renderer = {
    add_trailing = true,
    group_empty = true,
    highlight_opened_files = "all",
    highlight_git = true,
  },
  -- icons = {},
  actions = {
    open_file = {
      quit_on_open = true,
    },
  },
})
