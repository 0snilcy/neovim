local g = vim.g

-- vim.api.nvim_create_autocmd({ "VimEnter" }, {
-- 	callback = function()
-- 		local argv = vim.fn.argv()
-- 		if argv[1] == "." then
-- 			vim.api.nvim_command("Startify")
-- 		end
-- 	end,
-- })

-- NERDTreeHijackNetrw = 0

local function github()
	local dirs = vim.fn.systemlist("ls -d -1 $HOME/git/github/*")
	local res = {}

	for _, v in ipairs(dirs) do
		table.insert(res, {
			line = string.match(v, "[%d%l-]+$"),
			path = v,
		})
	end

	return res
end

github()

g.startify_lists = {
	{ type = "sessions", header = { "   Sessions" } },
	{ type = github, header = { "   Github" } },
	{ type = "files", header = { "   Files" } },
	-- { type = "dir", header = { "   Recent files" } },
	{ type = "bookmarks", header = { "   Bookemarks" } },
	{ type = "commands", header = { "   Commands" } },
}

g.startify_bookmarks = {
	"~/.zshrc",
	"$MYVIMRC",
}

g.startify_files_number = 5
g.startify_session_persistence = 1
g.startify_fortune_use_unicode = 1

-- Sort sessions by modification time (when the session files were written)
g.startify_session_sort = 1

g.startify_custom_header = ""
g.startify_use_env = 1
g.startify_padding_left = 4
