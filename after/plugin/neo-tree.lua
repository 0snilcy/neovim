local status, neotree = pcall(require, "neo-tree")
if not status then
  return
end

neotree.setup({
  close_if_last_window = true,
  hide_root_node = true,
  source_selector = {
    winbar = true,
    statusline = false,
    tab_labels = { -- falls back to source_name if nil
      filesystem = " Files ",
      buffers = " Buffers ",
      git_status = " Git ",
      diagnostics = " Diagnostics ",
    },
    separator = "",
  },
  popup_border_style = "rounded",
  default_component_configs = {
    git_status = {
      symbols = {
        -- Change type
        added = "A", -- or "✚", but this is redundant info if you use git_status_colors on the name
        modified = "M", -- or "", but this is redundant info if you use git_status_colors on the name
        deleted = "D", -- this can only be used in the git_status source
        renamed = "R", -- this can only be used in the git_status source
        -- Status type
        untracked = "U",
        ignored = "I",
        unstaged = "-S",
        staged = "+S",
        conflict = "M",
      },
    },
    diagnostics = {
      symbols = {
        hint = "H",
        info = "I",
        warn = "!",
        error = "X",
      },
      highlights = {
        -- hint = "DiagnosticSignHint",
        -- info = "DiagnosticSignInfo",
        -- warn = "DiagnosticSignWarn",
        -- error = "DiagnosticSignError",
      },
    },
    window = {
      position = "right",
    },
    container = {
      right_padding = 1,
    },
  },
})
