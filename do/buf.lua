local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
local text = vim.api.nvim_buf_get_text(0, 0, 0, -1, -1, {})
local window = vim.api.nvim_get_current_win()
local buf = vim.api.nvim_win_get_buf(window)
local buf_list = vim.api.nvim_list_bufs()
local options_info = vim.api.nvim_get_all_options_info()
local option = vim.api.nvim_buf_get_option(buf_list[3], "buftype")

-- vim.api.nvimwin

-- dump(lines)
dump(buf_list)
dump(option)
-- dump(options_info)

-- Moew
-- vim.api.nvim_buf_set_lines(0, 5, 6, false, { "-- Moew" })
-- vim.api.nvim_buf_set_lines(0, 5, 6, false, { "-- text to replace" })
