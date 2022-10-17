local status, kanagawa = pcall(require, "kanagawa")
if not status then
  return
end

local cp = require("kanagawa.colors").setup()
cp.none = "NONE"


local overrides = {
  FloatTitle = { bg = cp.none, blend = 0 },
  NormalFloat = { bg = cp.none, blend = 0 },
  FloatBorder = { bg = cp.none, blend = 0, fg = cp.springViolet1 },
  -- Folded = { fg = cp.blue, bg = cp.none },

  -- Visual = { bg = cp.surface2, style = {} }, -- Visual mode selection
  -- VisualNOS = { bg = cp.surface2, style = {} }, -- Visual mode selection when vim is "Not Owning the Selection".

  -- Pmenu = { bg = cp.pink, fg = cp.yellow },
  -- PmenuSel = { bg = cp.green, fg = cp.red },
  -- CmpItemMenu = { bg = cp.green, fg = cp.red },
  -- PmenuThumb = { bg = cp.surface2 },

  rainbowcol1 = { fg = cp.springViolet2 },
  rainbowcol2 = { fg = cp.springBlue },
  rainbowcol3 = { fg = cp.lightBlue },
  rainbowcol4 = { fg = cp.springViolet1 },
  rainbowcol5 = { fg = cp.oniViolet },
  rainbowcol6 = { fg = cp.crystalBlue },
  rainbowcol7 = { fg = cp.springBlue },

  -- IndentBlanklineIndent6 = { blend = 0, fg = cp.surface1 },
  -- IndentBlanklineIndent5 = { blend = 0, fg = cp.surface1 },
  -- IndentBlanklineIndent4 = { blend = 0, fg = cp.surface1 },
  -- IndentBlanklineIndent3 = { blend = 0, fg = cp.surface1 },
  -- IndentBlanklineIndent2 = { blend = 0, fg = cp.surface1 },
  -- IndentBlanklineIndent1 = { blend = 0, fg = cp.surface1 },

  LspInlayHint = { fg = cp.springViolet1, bg = cp.none },
  FidgetTitle = { fg = cp.springViolet1 },
  FidgetTask = { fg = cp.springViolet1 },
  WinSeparator = { fg = cp.springViolet1 },
  -- CursorLine = { bg = ucolors.darken(cp.surface0, 0.5, cp.base), blend = 0 },

  DiagnosticVirtualTextError = { fg = cp.fujiGray },
  DiagnosticVirtualTextWarn = { fg = cp.fujiGray },
  DiagnosticVirtualTextInfo = { fg = cp.fujiGray },
  DiagnosticVirtualTextHint = { fg = cp.fujiGray },
}

kanagawa.setup({
  undercurl = true, -- enable undercurls
  commentStyle = { italic = true },
  functionStyle = {},
  keywordStyle = { italic = true },
  statementStyle = { bold = true },
  typeStyle = {},
  variablebuiltinStyle = { italic = true },
  specialReturn = true, -- special highlight for the return keyword
  specialException = true, -- special highlight for exception handling keywords
  transparent = true, -- do not set background color
  dimInactive = false, -- dim inactive window `:h hl-NormalNC`
  globalStatus = false, -- adjust window separators highlight for laststatus=3
  terminalColors = false, -- define vim.g.terminal_color_{0,17}
  colors = {},
  overrides = overrides,
})

vim.cmd("colorscheme kanagawa")
