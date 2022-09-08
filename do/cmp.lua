local cmp = require("cmp")
-- dump(cmp.SelectBehavior)
-- dump(cmp.ConfirmBehavior)
-- dump(cmp.ContextReason)
-- dump(cmp)
-- dump(cmp.config.window.bordered())

-- vim.api.nvim_create_autocmd(
-- 	{ "BufWinEnter", "BufWinLeave", "WinClosed", "WinEnter", "WinLeave", "WinNew", "WinScrolled" },
-- 	{
-- 		pattern = "*",
-- 		callback = function(f)
-- 			dump(f.event)
-- 		end,
-- 	}
-- )

-- "column_width"
-- "entries"
-- "event"
-- "entries_win"
-- "offset"
-- "bottom_up"
-- "active"

-- "style"
-- "win"
-- "cache"
-- "opt"
-- "name"
-- "buffer_opt"

-- cmp.event:on("menu_opened", function(data)
-- 	for _, value1 in pairs(data) do
-- 		-- dump(value1.event)
-- 		local win = value1.entries_win
-- 		local win_id = win.win
-- 		-- local cnt = 1

-- 		-- vim.api.nvim_win_close(win_id, true)

-- 		-- local buf = vim.api.nvim_win_get_buf(win_id)
-- 		-- vim.api.nvim_buf_set_lines(buf, 5, 6, false, { tostring(cnt) })
-- 		-- cnt = cnt + 1

-- 		-- dump(win)
-- 		-- win:option("height", 15)
-- 		-- win:option("width", 15)
-- 		-- win:close()

-- 		vim.api.nvim_win_set_config(win_id, {
-- 			width = 1,
-- 			height = 1,
-- 			border = "none",
-- 		})
-- 		vim.api.nvim_win_set_option(win_id, "winhighlight", "CursorLine:None")
-- 		-- dump(vim.api.nvim_win_get_option(win_id, "winhighlight"))

-- 		-- for key2, value2 in pairs(win) do
-- 		-- 	-- dump(key2)
-- 		-- end

-- 		-- dump({ "------" })
-- 	end
-- end)
