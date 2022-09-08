local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
local text = vim.api.nvim_buf_get_text(0, 0, 0, -1, -1, {})
local window = vim.api.nvim_get_current_win()
local buf = vim.api.nvim_win_get_buf(window)
-- vim.api.nvimwin

-- dump(lines)
dump(buf)

-- Moew
-- vim.api.nvim_buf_set_lines(0, 5, 6, false, { "-- Moew" })
-- vim.api.nvim_buf_set_lines(0, 5, 6, false, { "-- text to replace" })
