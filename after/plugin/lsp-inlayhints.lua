local status, inlayhints = pcall(require, "lsp-inlayhints")
if not status then
	return
end

inlayhints.setup({})
