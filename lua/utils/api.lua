local M = {}

local nvim_open_win = vim.api.nvim_open_win
local nvim_buf_set_option = vim.api.nvim_buf_set_option

local win_filetype_cbs = {}
local buf_filetypes_cbs = {}

local call_cbs = function(cbs, buffer, window, filetype)
	local result = {
		cbs = cbs,
		buffer = buffer,
		window = window,
		filetype = filetype,
	}
	if cbs ~= nil then
		for _, cb in ipairs(cbs) do
			cb(result)
		end
	end
end

M.on_win_filetype_open = function(filetypes, callback)
	for _, filetype in ipairs(filetypes) do
		local cbs = win_filetype_cbs[filetype] or {}
		table.insert(cbs, callback)
		win_filetype_cbs[filetype] = cbs
	end
end

-- local function get_buf_win(buf_id)
-- 	local wins = vim.api.nvim_list_wins()

-- 	for _, win in pairs(wins) do
-- 		if buf_id == vim.api.nvim_win_get_buf(win) then
-- 			return win
-- 		end
-- 	end
-- end

vim.api.nvim_open_win = function(buffer, enter, config)
	local filetype = vim.api.nvim_buf_get_option(buffer, "filetype")
	local window = nvim_open_win(buffer, enter, config)

	if filetype == "" then
		buf_filetypes_cbs[buffer] = function(buf_filetype)
			call_cbs(win_filetype_cbs[buf_filetype], buffer, window, buf_filetype)
		end
	else
		call_cbs(win_filetype_cbs[filetype], buffer, window, filetype)
	end

	return window
end

vim.api.nvim_buf_set_option = function(buffer, name, value)
	if name == "filetype" and buf_filetypes_cbs[buffer] ~= nil then
		buf_filetypes_cbs[buffer](value)
	end
	return nvim_buf_set_option(buffer, name, value)
end

-- on_win_filetype_open({ "null-ls-info" }, function(result)
-- 	-- dump(result.filetype)
-- end)

return M
