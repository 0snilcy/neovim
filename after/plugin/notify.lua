local status, notify = pcall(require, "notify")
if not status then
	return
end

local max_width = 70

notify.setup({
	background_colour = "#000000",
	-- max_width = max_width,
	-- max_height = 10,
	stages = "static",
	top_down = false,
	-- on_open = function(win)
	-- 	local buf = vim.api.nvim_win_get_buf(win)
	-- 	local text = vim.api.nvim_buf_get_lines(buf, 1, -1, false)
	-- 	local result_text = {}

	-- 	for _, line in ipairs(text) do
	-- 		local new_lines = math.ceil(#line / max_width) - 1
	-- 		for i = 0, new_lines do
	-- 			local new_line = string.sub(line, max_width * i, max_width * i + max_width - 1)
	-- 			table.insert(result_text, new_line)
	-- 		end
	-- 	end

	-- dump(result_text)
	-- local new_buf = vim.api.nvim_create_buf(false, false)
	-- vim.api.nvim_buf_set_lines(new_buf, 0, -1, false, result_text)
	-- vim.api.nvim_win_set_buf(win, new_buf)
	-- end,
})
