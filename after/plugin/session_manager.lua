local status, session_manager = pcall(require, "session_manager")
if not status then
	return
end

session_manager.setup({
	autoload_mode = require("session_manager.config").AutoloadMode.Disabled,
	-- autosave_last_session = true,=
})
