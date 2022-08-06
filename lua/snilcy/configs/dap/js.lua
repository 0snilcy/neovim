local dap = require("dap")

local dapjs = require("dap-vscode-js")

---@diagnostic disable-next-line: param-type-mismatch
dapjs.setup({
	debugger_path = os.getenv("HOME") .. "/dev/vscode-js-debug",
	adapters = {
		"pwa-node",
		"pwa-chrome",
		"pwa-msedge",
		"node-terminal",
		"pwa-extensionHost",
	},
})

-- local is_firefox_debuf = false

dap.adapters.firefox = {
	type = "executable",
	command = "node",
	args = { os.getenv("HOME") .. "/dev/vscode-firefox-debug/dist/adapter.bundle.js" },
}

dap.adapters.chrome = {
	type = "executable",
	command = "node",
	-- args = { os.getenv("HOME") .. "/dev/vscode-chrome-debug/out/src/chromeDebug.js" },
	args = { "/mnt/c/Users/rocket/dev/vscode-chrome-debug/out/src/chromeDebug.js" },
}

dap.configurations.javascript = {
	{
		type = "pwa-node",
		request = "launch",
		name = "Launch file",
		program = "${file}",
		cwd = "${workspaceFolder}",
	},
	{
		type = "pwa-node",
		request = "attach",
		name = "Attach",
		processId = require("dap.utils").pick_process,
		cwd = "${workspaceFolder}",
	},
}
--
-- dap.configurations.javascript = {
-- 	{
-- 		type = "chrome",
-- 		request = "attach",
-- 		program = "${file}",
-- 		cwd = vim.fn.getcwd(),
-- 		sourceMaps = true,
-- 		protocol = "inspector",
-- 		port = 9222,
-- 		host = "192.168.112.1",
-- 		webRoot = "${workspaceFolder}",
-- 	},
-- }

-- dap.configurations.typescriptreact = {
-- 	name = "Debug with Firefox",
-- 	type = "firefox",
-- 	request = "launch",
-- 	reAttach = true,
-- 	url = "http://localhost:3000",
-- 	webRoot = "${workspaceFolder}",
-- 	firefoxExecutable = "/usr/bin/firefox",
-- }
