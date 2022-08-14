local M = {}

local MAX_ITEMS_PER_GROUP = 5
local sc_n = 0

function M.setup()
	local alpha = require("alpha")
	local startify = require("alpha.themes.startify")
	local session_utils = require("session_manager.utils")

	require("utils").log("SETUP", "WHO")

	local section = startify.section
	local button = startify.button
	local mru = function(start, cwd)
		return startify.mru(start, cwd, MAX_ITEMS_PER_GROUP)
	end

	local my_section = {
		mru = {
			type = "group",
			val = {
				{ type = "padding", val = 1 },
				{ type = "text", val = "Recent files", opts = { hl = "SpecialComment" } },
				{ type = "padding", val = 1 },
				{
					type = "group",
					val = function()
						require("utils").log("MRU", "WHO")
						return { mru(sc_n) }
					end,
				},
			},
		},
		session = {
			type = "group",
			val = {
				{ type = "padding", val = 1 },
				{ type = "text", val = "Sessions", opts = { hl = "SpecialComment" } },
				{ type = "padding", val = 1 },
				{
					type = "group",
					val = function()
						local res = {}
						local sessions = session_utils.get_sessions()
						--
						require("utils").log("SESSION", "WHO")

						for id, session in ipairs(sessions) do
							local filename = vim.fn.fnamemodify(session.dir.filename, ":~")
							local session_button = startify.button(
								tostring(sc_n),
								filename,
								-- "<CMD>lua require('session_manager.utils').load_session('" .. session.filename .. "')<CR>"
								-- ":lua " .. session.filename .. ")<CR>"
								"<CMD>echo 137"
							)

							require("utils").log(filename, "WHO")
							-- require("utils").dump({
							-- 	-- sc = sc_n,
							-- 	filename = filename,
							-- 	-- id = id,
							-- })

							sc_n = sc_n + 1
							table.insert(res, session_button)
						end

						return res
					end,
				},
			},
		},
	}

	startify.config.layout = {
		-- { type = "padding", val = 1 },
		-- section.header,
		-- { type = "padding", val = 1 },
		-- section.top_buttons,
		my_section.session,
		-- my_section.mru,
		-- section.mru,
		-- section.mru_cwd,
		-- { type = "padding", val = 1 },
		-- section.bottom_buttons,
		-- section.footer,
	}

	startify.config.opts.setup = nil
	-- startify.config.opts.autostart = false

	alpha.setup(startify.config)
end

return M
