local status, alpha = pcall(require, "alpha")
if not status then
	return
end

local MAX_ITEMS_PER_GROUP = 5

local nvim_web_devicons = {
	enabled = true,
	highlight = true,
}

local function get_extension(fn)
	local match = fn:match("^.+(%..+)$")
	local ext = ""
	if match ~= nil then
		ext = match:sub(2)
	end
	return ext
end

local function icon(fn)
	local nwd = require("nvim-web-devicons")
	local ext = get_extension(fn)
	return nwd.get_icon(fn, ext, { default = true })
end

local startify = require("alpha.themes.startify")
local session_utils = require("session_manager.utils")

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
					return { mru(MAX_ITEMS_PER_GROUP) }
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
					local sc_n = 0
					--
					-- require("utils").log("SESSION", "WHO")

					for _, session in ipairs(sessions) do
						local filename = vim.fn.fnamemodify(session.dir.filename, ":~")
						local ico_txt
						local fb_hl = {}

						if nvim_web_devicons.enabled then
							local ico, hl = icon(filename)
							local hl_option_type = type(nvim_web_devicons.highlight)
							if hl_option_type == "boolean" then
								if hl and nvim_web_devicons.highlight then
									table.insert(fb_hl, { hl, 0, 1 })
								end
							end
							if hl_option_type == "string" then
								table.insert(fb_hl, { nvim_web_devicons.highlight, 0, 1 })
							end
							ico_txt = ico .. "  "
						else
							ico_txt = ""
						end

						-- local file_button_el = button(sc, ico_txt .. short_fn, "<cmd>e " .. fn .. " <CR>")

						local session_button = button(
							tostring(sc_n),
							ico_txt .. filename,
							"<CMD>lua require('session_manager.utils').load_session('" .. session.filename .. "')<CR>"
						)

						sc_n = sc_n + 1

						local fn_start = filename:match(".*[/\\]")
						if fn_start ~= nil then
							table.insert(fb_hl, { "Comment", #ico_txt - 2, #fn_start + #ico_txt - 2 })
						end
						session_button.opts.hl = fb_hl
						table.insert(res, session_button)
					end

					return res
				end,
			},
		},
	},
}

startify.config.layout = {
	{ type = "padding", val = 1 },
	section.header,
	{ type = "padding", val = 1 },
	section.top_buttons,
	my_section.session,
	my_section.mru,
	-- section.mru,
	-- section.mru_cwd,
	{ type = "padding", val = 1 },
	section.bottom_buttons,
	section.footer,
}

startify.config.opts.setup = nil
-- startify.config.opts.autostart = false

alpha.setup(startify.config)
