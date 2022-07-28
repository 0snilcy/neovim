local M = {}

function M.setup()
  local legendary = require "legendary"

  local conf = {
    keymaps = {
      { '<A-p>s', ':PackerSync<CR>', description = 'PackerSync' },
      { '<A-p>i', ':PackerInstall<CR>', description = 'PackerInstall' },
      { '<A-p>c', ':PackerCompile<CR>', description = 'PackerCompile' },
      { '<A-p>u', ':PackerUpdate<CR>', description = 'PackerUpdate' },
    }
  }

  require("legendary").setup(
    {
      include_builtin = true,
      -- auto_register_which_key = true
    }
  )


  vim.api.nvim_set_keymap(
    "n", "<C-p>", "<cmd>lua require('legendary').find()<CR>",
    { noremap = true, silent = true }
  )

  legendary.setup(conf)
end

return M
